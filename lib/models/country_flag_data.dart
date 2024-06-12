import 'dart:convert';

List<CountryFlag> fromJsonCountryFlags(String data) =>
    List<CountryFlag>.from(jsonDecode(data).map(
      (e) => CountryFlag.fromJson(e),
    ));

String toJsonCountryFlags(List<CountryFlag> data) => jsonEncode(data);

class CountryFlag {
  String flag;
  String country;
  String code;

  CountryFlag({
    required this.flag,
    required this.country,
    required this.code,
  });

  factory CountryFlag.fromJson(Map<String, Object?> json) => CountryFlag(
        flag: json["flag"] as String,
        country: json["country"] as String,
        code: json["code"] as String,
      );

  Map<String, Object?> toJson() => {
        "flag": flag,
        "country": country,
        "code": code,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryFlag &&
          runtimeType == other.runtimeType &&
          flag == other.flag &&
          country == other.country &&
          code == other.code;

  @override
  int get hashCode => Object.hash(flag, country, code);

  CountryFlag copyWith({
    String? flag,
    String? country,
    String? code,
  }) =>
      CountryFlag(
        flag: flag ?? this.flag,
        country: country ?? this.country,
        code: code ?? this.code,
      );

  @override
  String toString() {
    return "CountryFlag(\n"
        "\tflag: $flag\n"
        "\tcountry: $country\n"
        "\tcode: $code\n"
        ")";
  }
}
