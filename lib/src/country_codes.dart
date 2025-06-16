import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'country_constants.dart';
import 'country_model.dart';

class CountryCodes {
  static const MethodChannel _channel = const MethodChannel('country_codes');
  static late var countriesMap = countryDetailsMap.map(
    (key, value) => MapEntry(key, CountryModel.fromJson(value)),
  );

  /// Inits the underlying plugin channel and fetch current's device locale to be ready
  /// to use synchronously when required.
  ///
  /// If you never plan to provide a `locale` directly, you must call and await this
  /// by calling `await CountryCodes.initLocalized();` before accessing any other method.
  ///
  /// Optionally, you may want to provide your [appLocale] to access localized
  /// country name (eg. if your app is in English, display Italy instead of Italia).
  ///
  /// Example:
  /// ```dart
  /// CountryCodes.initLocalized(Localizations.localeOf(context))
  /// ```
  /// This will default to device's language if none is provided.
  static Future<void> initLocalized([Locale? appLocale]) async {
    Map<String, String> localizedNames = {};
    final res = await _channel.invokeMethod(
      'getLocale',
      appLocale?.toLanguageTag(),
    );
    final List<dynamic>? locale = List<dynamic>.from(res);
    if (locale != null && locale.length >= 2) {
      String countryCode = locale[1];

      if (!countryDetailsMap.containsKey(countryCode)) {
        countryCode = subRegionToCountryCode[countryCode] ?? countryCode;
      }

      localizedNames.addAll(Map.from(locale[2]));
    }

    if (countriesMap.isNotEmpty) {
      countriesMap = countriesMap.map(
        (key, value) => MapEntry(
          key,
          value.copyWith(localizedName: localizedNames[key]),
        ),
      );
    } else {
      countriesMap = countryDetailsMap.map(
        (key, value) => MapEntry(
          key,
          CountryModel.fromJson(value, localizedNames[key]),
        ),
      );
    }
  }

  static final List<CountryModel> countries = countriesMap.values.toList();

  static CountryModel? getByAlpha2(String alpha2Code) =>
      countriesMap[alpha2Code];

  static CountryModel? getByAlpha3(String alpha3Code) => countriesMap.values
      .firstWhereOrNull((element) => element.alpha3Code == alpha3Code);

  static CountryModel? getByCountryCode(String countryCode) =>
      countriesMap.values
          .firstWhereOrNull((element) => element.countryCode == countryCode);

  static CountryModel? getByDialCode(String dialCode) => countriesMap.values
      .firstWhereOrNull((element) => element.dialCode == dialCode);

  static List<CountryModel> getCountriesByLocalizedName(String localizedName) =>
      countriesMap.values
          .where((element) => element.localizedName == localizedName)
          .toList();

  static List<CountryModel> getCountriesByName(String name) =>
      countriesMap.values.where((element) => element.name == name).toList();

  static List<String> getCountryEnglishNames() =>
      countriesMap.values.map((element) => element.name).toList();

  static List<String> getLocalizedNames() =>
      countriesMap.values.map((element) => element.localizedOrName).toList();

  static List<String> getAlpha2Codes() => countriesMap.keys.toList();

  static List<String> getAlpha3Codes() =>
      countriesMap.values.map((element) => element.alpha3Code).toList();

  static List<String> getCountryCodes() =>
      countriesMap.values.map((element) => element.countryCode).toList();

  static List<String> getDialCodes() =>
      countriesMap.values.map((element) => element.dialCode).toList();

  static List<CountryModel> getCountryListByAlpha2Codes(
          List<String> alpha2Codes) =>
      alpha2Codes.map((e) => countriesMap[e]!).toList();
}
