import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'country_constants.dart';
import 'country_model.dart';
import 'language_constants.dart';
import 'language_model.dart';

class CountryCodes {
  static const MethodChannel _channel = const MethodChannel('country_codes');
  static late var countriesMap = kAlpha2ToCountryMap.map(
    (key, value) => MapEntry(key, CountryModel.fromJson(value)),
  );
  static late var languagesMap = kLanguageCodeToLanguageMap.map(
    (key, value) => MapEntry(key, LanguageModel.fromJson(value)),
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

      if (!kAlpha2ToCountryMap.containsKey(countryCode)) {
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
      countriesMap = kAlpha2ToCountryMap.map(
        (key, value) => MapEntry(
          key,
          CountryModel.fromJson(value, localizedNames[key]),
        ),
      );
    }
  }

  /// Inits language support with localized language names from the device/platform.
  ///
  /// This method fetches localized language names from the native platform
  /// and populates the languages map with localized names based on the device's
  /// current locale or the provided [appLocale].
  ///
  /// Example:
  /// ```dart
  /// await CountryCodes.initLanguagesLocalized(Localizations.localeOf(context));
  /// ```
  /// This will default to device's language if none is provided.
  static Future<void> initLanguagesLocalized([Locale? appLocale]) async {
    Map<String, String> localizedLanguageNames = {};
    final res = await _channel.invokeMethod(
      'getLanguageLocale',
      appLocale?.toLanguageTag(),
    );
    final List<dynamic>? localeData = List<dynamic>.from(res);
    if (localeData != null && localeData.length >= 3) {
      localizedLanguageNames.addAll(Map.from(localeData[2]));
    }

    if (languagesMap.isNotEmpty) {
      languagesMap = languagesMap.map(
        (key, value) => MapEntry(
          key,
          value.copyWith(localizedName: localizedLanguageNames[key.toUpperCase()]),
        ),
      );
    } else {
      languagesMap = kLanguageCodeToLanguageMap.map(
        (key, value) => MapEntry(
          key,
          LanguageModel.fromJson(value, localizedLanguageNames[key.toUpperCase()]),
        ),
      );
    }
  }

  /// Initializes languages with non-localized (English) names only.
  ///
  /// Use this method if you don't need localized language names or want to
  /// avoid the async platform call.
  static void initLanguages() {
    languagesMap = kLanguageCodeToLanguageMap.map(
      (key, value) => MapEntry(key, LanguageModel.fromJson(value)),
    );
  }

  static Iterable<CountryModel> get _countriesIterable => countriesMap.values;
  static List<CountryModel> get countries => _countriesIterable.toList();

  static CountryModel? getByAlpha2(String alpha2Code) =>
      countriesMap[alpha2Code];

  static CountryModel? getByAlpha3(String alpha3Code) => _countriesIterable
      .firstWhereOrNull((element) => element.alpha3Code == alpha3Code);

  static CountryModel? getByCountryCode(String countryCode) =>
      _countriesIterable
          .firstWhereOrNull((element) => element.countryCode == countryCode);

  static CountryModel? getByDialCode(String dialCode) => _countriesIterable
      .firstWhereOrNull((element) => element.dialCode == dialCode);

  static List<CountryModel> getCountriesByLocalizedName(String localizedName) =>
      _countriesIterable
          .where((element) => element.localizedName == localizedName)
          .toList();

  static List<CountryModel> getCountriesByName(String name) =>
      _countriesIterable.where((element) => element.name == name).toList();

  static List<String> getCountryEnglishNames() =>
      _countriesIterable.map((element) => element.name).toList();

  static List<String> getLocalizedNames() =>
      _countriesIterable.map((element) => element.localizedOrName).toList();

  static List<String> getAlpha2Codes() => countriesMap.keys.toList();

  static List<String> getAlpha3Codes() =>
      _countriesIterable.map((element) => element.alpha3Code).toList();

  static List<String> getCountryCodes() =>
      _countriesIterable.map((element) => element.countryCode).toList();

  static List<String> getDialCodes() =>
      _countriesIterable.map((element) => element.dialCode).toList();

  static List<CountryModel> getCountryListByAlpha2Codes(
          List<String> alpha2Codes) =>
      alpha2Codes.map((e) => countriesMap[e]!).toList();

  // Language-related methods
  
  static Iterable<LanguageModel> get _languagesIterable => languagesMap.values;
  
  /// Returns a list of all available languages
  static List<LanguageModel> get languages => _languagesIterable.toList();

  /// Gets a language by its ISO 639-1 code (2-letter code)
  /// 
  /// Example: `getLanguageByISO639_1('en')` returns English language model
  static LanguageModel? getLanguageByISO639_1(String iso639_1) =>
      languagesMap[iso639_1];

  /// Gets a language by its ISO 639-2 code (3-letter code)
  /// 
  /// Example: `getLanguageByISO639_2('eng')` returns English language model
  static LanguageModel? getLanguageByISO639_2(String iso639_2) => 
      _languagesIterable.firstWhereOrNull((element) => element.iso639_2 == iso639_2);

  /// Gets languages by their country code association
  /// 
  /// Example: `getLanguagesByCountryCode('en_US')` returns languages associated with US
  static List<LanguageModel> getLanguagesByCountryCode(String countryCode) =>
      _languagesIterable
          .where((element) => element.countryCode == countryCode)
          .toList();

  /// Gets languages by their localized name
  static List<LanguageModel> getLanguagesByLocalizedName(String localizedName) =>
      _languagesIterable
          .where((element) => element.localizedName == localizedName)
          .toList();

  /// Gets languages by their English name
  static List<LanguageModel> getLanguagesByName(String name) =>
      _languagesIterable
          .where((element) => element.name == name)
          .toList();

  /// Returns a list of all language English names
  static List<String> getLanguageEnglishNames() =>
      _languagesIterable.map((element) => element.name).toList();

  /// Returns a list of all localized language names
  static List<String> getLanguageLocalizedNames() =>
      _languagesIterable.map((element) => element.localizedOrName).toList();

  /// Returns a list of all ISO 639-1 codes
  static List<String> getISO639_1Codes() => languagesMap.keys.toList();

  /// Returns a list of all ISO 639-2 codes
  static List<String> getISO639_2Codes() =>
      _languagesIterable.map((element) => element.iso639_2).toList();

  /// Returns a list of all language country codes
  static List<String> getLanguageCountryCodes() =>
      _languagesIterable.map((element) => element.countryCode).toList();

  /// Gets a list of languages by their ISO 639-1 codes
  static List<LanguageModel> getLanguageListByISO639_1Codes(
          List<String> iso639_1Codes) =>
      iso639_1Codes.map((e) => languagesMap[e]!).toList();
}
