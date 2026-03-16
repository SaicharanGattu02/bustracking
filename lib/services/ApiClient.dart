import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/constants.dart';
import 'AuthService.dart';
import 'api_endpoint_urls.dart';

class ApiClient {

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIEndpointUrls.baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {"Content-Type": "application/json"},
      // 2xx–4xx are treated as normal responses; 5xx become errors
      validateStatus: (status) => status != null && status < 500,
      // optional but handy:
      receiveDataWhenStatusError: true,
    ),
  );

  static void setupInterceptors() {
    _dio.interceptors.clear();

    // 1) Auth interceptor (token attach + refresh)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          debugPrint('Interceptor triggered for: ${options.uri}');

          // 🚫 Skip interceptor for refresh token API
          if (options.path.contains(APIEndpointUrls.refreshtoken)) {
            debugPrint('🔁 Refresh-token API → skipping auth interceptor');
            return handler.next(options);
          }

          final isGuestUser = await AuthService.isGuest;
          if (isGuestUser) {
            options.headers.remove('Authorization');
            return handler.next(options);
          }

          final isExpired = await AuthService.isTokenExpired();
          if (isExpired) {
            final refreshed = await _refreshToken();
            if (!refreshed) {
              await AuthService.logout();
              return handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.cancel,
                  error: 'Session expired',
                ),
              );
            }
          }

          final accessToken = await AuthService.getAccessToken();
          if (accessToken?.isNotEmpty == true) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },

      ),
    );

    // 2) Global status handling interceptor
    _dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, handler) async {
          final status = response.statusCode ?? 0;

          if (status >= 200 && status <= 400) {
            // success
            return handler.next(response);
          }
          // 4xx arrive here because validateStatus(<500) returns true
          if (status == 401) {
            debugPrint('❌ 401 Unauthorized, logging out...');
            await AuthService.logout();
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: 'Unauthorized, please log in again',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          if (status == 403) {
            debugPrint('❌ 403 Account Blocked');
            final context = navigatorKey.currentContext;
            context?.go('/blocked_account');
            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: 'Your account is blocked',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          // Any other 4xx -> normalize as DioException so repos/cubits can handle uniformly
          return handler.reject(
            DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: 'Request failed (${response.statusCode})',
              type: DioExceptionType.badResponse,
            ),
          );
        },

        onError: (DioException e, handler) {
          // Only 5xx (and network/timeout/cancel) reach here due to validateStatus(<500)
          final code = e.response?.statusCode;
          // final isServerDown =
          //     code == 500 ||
          //         code == 502 ||
          //         code == 503 ||
          //         code == 504 ||
          //         e.type == DioExceptionType.connectionError ||
          //         e.type == DioExceptionType.connectionTimeout ||
          //         e.type == DioExceptionType.receiveTimeout ||
          //         e.type == DioExceptionType.sendTimeout;
          //
          // if (isServerDown) {
          //   debugPrint('🚨 Server down detected');
          //   serverDownNotifier.value = true;
          // }



          if (code == 401) {
            // defensive: if a 401 still ends up here
            AuthService.logout();
            return handler.next(
              DioException(
                requestOptions: e.requestOptions,
                response: e.response,
                error: 'Unauthorized, please log in again',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          if (code == 403) {
            final context = navigatorKey.currentContext;
            context?.go('/blocked_account');
            return handler.next(
              DioException(
                requestOptions: e.requestOptions,
                response: e.response,
                error: 'Your account is blocked',
                type: DioExceptionType.badResponse,
              ),
            );
          }

          // Optionally map timeouts / no-internet to friendly errors
          if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.receiveTimeout ||
              e.type == DioExceptionType.sendTimeout) {
            return handler.next(
              DioException(
                requestOptions: e.requestOptions,
                error: 'Network timeout, please try again',
                type: e.type,
                response: e.response,
              ),
            );
          }

          if (e.type == DioExceptionType.connectionError) {
            return handler.next(
              DioException(
                requestOptions: e.requestOptions,
                error: 'No internet connection',
                type: e.type,
                response: e.response,
              ),
            );
          }

          // leave others as-is (includes 5xx)
          return handler.next(e);
        },
      ),
    );
  }

  static Future<bool> _refreshToken() async {
    try {
      final newToken = await AuthService.refreshToken();
      if (newToken) {
        debugPrint("✅ Token refreshed successfully");
        return true;
      }
      debugPrint("❌ Token refresh returned false");
    } catch (e) {
      debugPrint("❌ Token refresh failed: $e");
    }
    return false;
  }

  static Future<Response> get(
      String path, {
        Map<String, dynamic>? queryParameters,
      }) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> put(String path, {dynamic data}) async {
    try {
      return await _dio.put(path, data: data);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> patch(String path, {dynamic data}) async {
    try {
      return await _dio.patch(path, data: data);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Response _handleError(dynamic error) {
    if (error is DioException) {
      throw error;
    } else {
      throw Exception("Unexpected error occurred");
    }
  }

  // Placeholder for _handleNavigation (implement as needed)
  static void _handleNavigation(
      int? statusCode,
      GlobalKey<NavigatorState> navigatorKey,
      ) {}
}
