import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'language_constants.dart';
import 'language_model.dart';
import 'method_channel.dart';

/// LanguageCodes provides language localization and lookup, mirroring CountryCodes.
class LanguageCodes {
  static late Map<String, LanguageModel> languagesMap = kLanguageCodeToLanguageMap.map(
    (key, value) => MapEntry(key, LanguageModel.fromMap(value)),
  );
  static late List<LanguageModel> _languagesList = languagesMap.values.toList();

  /// Initializes localized language names from the platform, using the given [appLocale] if provided.
  static Future<void> initLanguagesLocalized([Locale? appLocale]) async {
    Map<String, String> localizedNames = {};
    final List<dynamic>? locale = await CountryCodesMethodChannel.getLanguageLocale(
      appLocale?.toLanguageTag(),
    );
    if (locale != null && locale.length >= 3) {
      localizedNames.addAll(Map<String, String>.from(locale[2]));
    }

    if (languagesMap.isNotEmpty) {
      languagesMap = languagesMap.map(
        (key, value) => MapEntry(
          key,
          value.copyWith(localizedName: localizedNames[key.toUpperCase()]),
        ),
      );
    } else {
      languagesMap = kLanguageCodeToLanguageMap.map(
        (key, value) => MapEntry(
          key,
          LanguageModel.fromMap(value, localizedNames[key.toUpperCase()]),
        ),
      );
    }

    _languagesList = await sortByLocalized(true, appLocale);
  }

  /// Returns all supported languages as a list.
  static List<LanguageModel> get languages => _languagesList;

  /// Returns a language by ISO 639-1 code.
  static LanguageModel? getLanguageByISO639_1(String iso639_1) =>
      languagesMap[iso639_1];

  /// Returns a language by ISO 639-2 code.
  static LanguageModel? getLanguageByISO639_2(String iso639_2) =>
      languagesMap.values.firstWhereOrNull((e) => e.iso639_2 == iso639_2);

  /// Returns a language by English name.
  static LanguageModel? getLanguageByName(String name) =>
      languagesMap.values.firstWhereOrNull((e) => e.name == name);

  /// Returns a language by localized name.
  static LanguageModel? getLanguageByLocalizedName(String localizedName) =>
      languagesMap.values.firstWhereOrNull((e) => e.localizedOrName == localizedName);

  /// Returns all language English names.
  static List<String> getLanguageEnglishNames() =>
      languagesMap.values.map((e) => e.name).toList();

  /// Returns all localized language names.
  static List<String> getLocalizedNames() =>
      languagesMap.values.map((e) => e.localizedOrName).toList();

  /// Returns all ISO 639-1 codes.
  static List<String> getISO639_1Codes() => languagesMap.keys.toList();

  /// Returns all ISO 639-2 codes.
  static List<String> getISO639_2Codes() =>
      languagesMap.values.map((e) => e.iso639_2).toList();

  /// Returns all primary country codes for languages.
  static List<String> getPrimaryCountryCodes() =>
      languagesMap.values.map((e) => e.countryCode).toList();

  /// Returns a new list of LanguageModel sorted by localized name using native locale-aware sorting.
  static Future<List<LanguageModel>> sortByLocalized(bool ascending, [Locale? appLocale]) async {
    final names = languagesMap.values.map((l) => l.localizedOrName).toList();
    final sortedNames = await CountryCodesMethodChannel.sortByLocalized(
      names, appLocale?.toLanguageTag(), ascending);
    return sortedNames
        .map((name) => languagesMap.values.firstWhereOrNull((l) => l.localizedOrName == name))
        .whereType<LanguageModel>()
        .toList();
  }
}
