import 'package:flutter/services.dart';

/// Shared method channel for country and language codes.
class CountryCodesMethodChannel {
  static const MethodChannel _channel = MethodChannel('country_codes');

  /// Gets the device locale and localized country names.
  static Future<List<dynamic>?> getLocale(String? localeTag) async {
    final res = await _channel.invokeMethod('getLocale', localeTag);
    return res != null ? List<dynamic>.from(res) : null;
  }

  /// Gets the device language locale and localized language names.
  static Future<List<dynamic>?> getLanguageLocale(String? localeTag) async {
    final res = await _channel.invokeMethod('getLanguageLocale', localeTag);
    return res != null ? List<dynamic>.from(res) : null;
  }

  /// Gets the device region code.
  static Future<String?> getRegion() async {
    return await _channel.invokeMethod('getRegion');
  }

  /// Gets the device language code.
  static Future<String?> getLanguage() async {
    return await _channel.invokeMethod('getLanguage');
  }
}
