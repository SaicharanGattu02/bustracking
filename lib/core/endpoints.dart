class APIEndpointUrls {

  static const String userUrl = 'user/';
  static const String auth = '${userUrl}/auth/';
  static const String chat = '${userUrl}/chat/';

  static const String login = '${auth}login';
  static const String reset_password = '${auth}reset-password';
  static const String get_profile = '${auth}profile';
  static const String profile_update = '${auth}profile';
  static const String forgot_password = '${auth}forgot-password';
  static const String verify_otp = '${auth}verify-otp';
  static const String user_list = '${chat}user';
  static const String user_messages = '${chat}user/';
}
