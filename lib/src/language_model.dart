import 'package:equatable/equatable.dart';
import 'country_codes.dart';
import 'country_model.dart';

/// Model representing a language, including codes, names, and localization.
class LanguageModel extends Equatable {
  /// ISO 639-1 two-letter code.
  final String iso639_1;

  /// ISO 639-2 three-letter code.
  final String iso639_2;

  /// English name of the language.
  final String name;

  /// Primary country code (e.g., 'en_US').
  final String countryCode;

  /// Localized name (if available).
  final String? localizedName;

  const LanguageModel({
    required this.iso639_1,
    required this.iso639_2,
    required this.name,
    required this.countryCode,
    this.localizedName,
  });

  /// Returns the primary country [CountryModel] for this language.
  CountryModel? get primaryCountry {
    final countryAlpha2 = countryCode.split('_').last;
    return CountryCodes.getByAlpha2(countryAlpha2);
  }

  /// Returns the localized name if available, otherwise the English name.
  String get localizedOrName => localizedName ?? name;

  /// Creates a copy with optional new values.
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

  @override
  List<Object?> get props => [iso639_1, iso639_2, name, countryCode, localizedName];

  /// Factory from map (e.g., from constants).
  factory LanguageModel.fromMap(Map<String, String> map, {String? localizedName}) {
    return LanguageModel(
      iso639_1: map['iso639_1'] ?? '',
      iso639_2: map['iso639_2'] ?? '',
      name: map['name'] ?? '',
      countryCode: map['country_code'] ?? '',
      localizedName: localizedName,
    );
  }
}
