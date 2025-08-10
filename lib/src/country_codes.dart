import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'country_constants.dart';
import 'country_model.dart';
import 'method_channel.dart';

class CountryCodes {
  static late var countriesMap = kAlpha2ToCountryMap.map(
    (key, value) => MapEntry(key, CountryModel.fromJson(value)),
  );

  static late List<CountryModel> _countriesList = countriesMap.values.toList();

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
    final List<dynamic>? locale = await CountryCodesMethodChannel.getLocale(
      appLocale?.toLanguageTag(),
    );
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

    _countriesList = await sortByLocalized(true, appLocale);
  }

  static List<CountryModel> get countries => _countriesList;

  static CountryModel? getByAlpha2(String alpha2Code) =>
      countriesMap[alpha2Code];

  static CountryModel? getByAlpha3(String alpha3Code) => countries
      .firstWhereOrNull((element) => element.alpha3Code == alpha3Code);

  static CountryModel? getByCountryCode(String countryCode) =>
      countries
          .firstWhereOrNull((element) => element.countryCode == countryCode);

  static CountryModel? getByDialCode(String dialCode) => countries
      .firstWhereOrNull((element) => element.dialCode == dialCode);

  static List<CountryModel> getCountriesByLocalizedName(String localizedName) =>
      countries
          .where((element) => element.localizedName == localizedName)
          .toList();

  static List<CountryModel> getCountriesByName(String name) =>
      countries.where((element) => element.name == name).toList();

  static List<String> getCountryEnglishNames() =>
      countries.map((element) => element.name).toList();

  static List<String> getLocalizedNames() =>
      countries.map((element) => element.localizedOrName).toList();

  static List<String> getAlpha2Codes() => countriesMap.keys.toList();

  static List<String> getAlpha3Codes() =>
      countries.map((element) => element.alpha3Code).toList();

  static List<String> getCountryCodes() =>
      countries.map((element) => element.countryCode).toList();

  static List<String> getDialCodes() =>
      countries.map((element) => element.dialCode).toList();

  static List<CountryModel> getCountryListByAlpha2Codes(
          List<String> alpha2Codes) =>
      alpha2Codes.map((e) => countriesMap[e]!).toList();

  /// Returns a new list of CountryModel sorted by localized name using native locale-aware sorting.
  static Future<List<CountryModel>> sortByLocalized(bool ascending, [Locale? appLocale]) async {
    final names = countries.map((c) => c.localizedOrName).toList();
    final sortedNames = await CountryCodesMethodChannel.sortByLocalized(
      names, appLocale?.toLanguageTag(), ascending);
    return sortedNames
        .map((name) => countries.firstWhereOrNull((c) => c.localizedOrName == name))
        .whereType<CountryModel>()
        .toList();
  }
}
