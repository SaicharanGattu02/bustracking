import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'color_constants.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

String capitalize(String value) {
  if (value.isEmpty) return "";
  return value[0].toUpperCase() + value.substring(1).toLowerCase();
}

class DateHelper {
  static String formatDateTime(String? rawTime) {
    if (rawTime == null || rawTime.isEmpty) return "";
    try {
      final dateTime = DateTime.parse(rawTime);
      return DateFormat('dd MMM yyyy • hh:mm a').format(dateTime);
    } catch (e) {
      return rawTime;
    }
  }

  static String timeAgo(String? rawTime) {
    if (rawTime == null || rawTime.isEmpty) return "";
    try {
      final dateTime = DateTime.parse(rawTime);
      final Duration diff = DateTime.now().difference(dateTime);

      if (diff.inSeconds < 60) {
        return "just now";
      } else if (diff.inMinutes < 60) {
        return "${diff.inMinutes}m ago";
      } else if (diff.inHours < 24) {
        return "${diff.inHours}h ago";
      } else if (diff.inDays == 1) {
        return "yesterday";
      } else if (diff.inDays < 7) {
        return "${diff.inDays}d ago";
      } else {
        return DateFormat('dd MMM yyyy').format(dateTime);
      }
    } catch (e) {
      return rawTime;
    }
  }
}

String formatDate(String? rawDate) {
  if (rawDate == null || rawDate.isEmpty) return "";
  try {
    final date = DateTime.parse(rawDate);
    return DateFormat('dd MMM yyyy').format(date);
  } catch (e) {
    return rawDate;
  }
}

String formatTimeRange(String? rawTime) {
  if (rawTime == null || rawTime.isEmpty) return "";

  try {
    // Split by dash
    final parts = rawTime.split(RegExp(r'[-–]'));
    if (parts.length == 2) {
      final start = _parseAndFormatTime(parts[0].trim());
      final end = _parseAndFormatTime(parts[1].trim());
      return "$start – $end";
    } else {
      return _parseAndFormatTime(rawTime.trim());
    }
  } catch (e) {
    return rawTime;
  }
}

String _parseAndFormatTime(String raw) {
  try {
    // Try parsing strict HH:mm:ss
    if (RegExp(r'^\d{2}:\d{2}(:\d{2})?$').hasMatch(raw)) {
      final parsed = DateFormat("HH:mm").parse(raw, true).toLocal();
      return DateFormat("hh:mm a").format(parsed);
    }

    // Try parsing already with AM/PM
    return DateFormat("hh:mm a").format(DateFormat("h:mm a").parse(raw));
  } catch (_) {
    return raw; // fallback to raw string
  }
}

String to24Format(String time12h) {
  if (time12h.trim().isEmpty) return ""; // <--- prevent crash

  try {
    final dt = DateFormat.jm().parse(time12h);
    return DateFormat('HH:mm').format(dt);
  } catch (e) {
    return ""; // return empty instead of crashing
  }
}

final String figtree = "Figtree";
