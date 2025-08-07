import 'package:equatable/equatable.dart';

import 'country_codes.dart';
import 'country_model.dart';

/// A model class that represents a language with its ISO codes,
/// localized name, and associated primary country
class LanguageModel extends Equatable {
  /// ISO 639-1 two-letter language code
  /// Example: `en`, `fr`, `es`
  final String iso639_1;

  /// ISO 639-2 three-letter language code
  /// Example: `eng`, `fre`, `spa`
  final String iso639_2;

  /// English name of the language
  /// Example: `English`, `French`, `Spanish`
  final String name;

  /// Primary country code associated with this language in format '{language}_{COUNTRY}'
  /// Example: `en_US`, `fr_FR`, `es_ES`
  final String countryCode;

  /// Localized name of the language based on device/app locale
  /// Example: If device is in French, English might be shown as `Anglais`
  final String? localizedName;

  @override
  List<Object?> get props => [
        iso639_1,
        iso639_2,
        name,
        countryCode,
        localizedName,
      ];

  const LanguageModel({
    required this.iso639_1,
    required this.iso639_2,
    required this.name,
    required this.countryCode,
    this.localizedName,
  });

  factory LanguageModel.fromJson(
    Map<String, dynamic> json, [
    String? localizedName,
  ]) {
    return LanguageModel(
      iso639_1: json['iso639_1'] as String,
      iso639_2: json['iso639_2'] as String,
      name: json['name'] as String,
      countryCode: json['country_code'] as String,
      localizedName: localizedName ?? json['localized_name'] as String?,
    );
  }

  LanguageModel copyWith({
    String? iso639_1,
    String? iso639_2,
    String? name,
    String? countryCode,
    String? localizedName,
  }) {
    return LanguageModel(
      iso639_1: iso639_1 ?? this.iso639_1,
      iso639_2: iso639_2 ?? this.iso639_2,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      localizedName: localizedName ?? this.localizedName,
    );
  }

  /// Gets the primary country associated with this language for flag display
  /// Returns null if the country code is not found or is a generic code (XX)
  CountryModel? get primaryCountry {
    final countryAlpha2 = countryCode.split('_').last;
    if (countryAlpha2 == 'XX') return null;
    return CountryCodes.getByAlpha2(countryAlpha2);
  }

  /// Returns the localized name if available, otherwise returns the English name
  String get localizedOrName => localizedName ?? name;

  /// Gets the flag emoji for the primary country, if available
  String? get flagEmoji => primaryCountry?.flagEmoji;

  /// Checks if the language contains a specific query string in any of its fields
  bool containsString(String query) {
    final lowerQuery = query.toLowerCase();
    return localizedOrName.toLowerCase().contains(lowerQuery) ||
        name.toLowerCase().contains(lowerQuery) ||
        iso639_1.toLowerCase().contains(lowerQuery) ||
        iso639_2.toLowerCase().contains(lowerQuery) ||
        countryCode.toLowerCase().contains(lowerQuery);
  }
}