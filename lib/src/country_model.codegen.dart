class CountryModel {
  /// Dial code represents a global phone prefix for the region
  /// Example: `+1`, `+351`
  final String dialCode;

  /// ISO 3166 alpha 2 code
  /// Example: `US`, `PT`
  final String alpha2Code;

  /// ISO 3166 alpha 3 code
  /// Example: `USA`, `PRT`
  final String alpha3Code;

  /// Country code
  /// Example: `en_US`
  final String countryCode;

  /// Extended country name in its own language
  ///
  /// Examples:
  /// US : United States
  /// IT : Italia
  /// DE : Deutschland
  final String name;

  /// Extended country name based on a region language
  ///
  /// Examples for `US`:
  /// US : United States
  /// IT : Italy
  /// DE : Germany
  final String? localizedName;

  const CountryModel({
    required this.dialCode,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.countryCode,
    required this.name,
    this.localizedName,
  });

  factory CountryModel.fromJson(
    Map<String, dynamic> json, [
    String? localizedName,
  ]) {
    return CountryModel(
      dialCode: json['dial_code'] as String,
      alpha2Code: json['alpha2_code'] as String,
      alpha3Code: json['alpha3_code'] as String,
      countryCode: json['country_code'] as String,
      name: json['name'] as String,
      localizedName: localizedName ?? json['localized_name'] as String?,
    );
  }

  CountryModel copyWith({
    String? dialCode,
    String? alpha2Code,
    String? alpha3Code,
    String? countryCode,
    String? name,
    String? localizedName,
  }) {
    return CountryModel(
      dialCode: dialCode ?? this.dialCode,
      alpha2Code: alpha2Code ?? this.alpha2Code,
      alpha3Code: alpha3Code ?? this.alpha3Code,
      countryCode: countryCode ?? this.countryCode,
      name: name ?? this.name,
      localizedName: localizedName ?? this.localizedName,
    );
  }

  String get flagEmoji => alpha2Code
      .toUpperCase()
      .split('')
      .map((c) => c.codeUnitAt(0) + 127397)
      .map(String.fromCharCode)
      .join();

  String get localizedOrName => localizedName ?? name;

  bool containsString(String query) {
    final lowerQuery = query.toLowerCase();
    return localizedOrName.toLowerCase().contains(lowerQuery) ||
        alpha3Code.toLowerCase().contains(lowerQuery) ||
        countryCode.toLowerCase().contains(lowerQuery) ||
        dialCode.toLowerCase().contains(lowerQuery);
  }
}
