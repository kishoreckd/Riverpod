import 'dart:convert';
import 'package:meta/meta.dart';
// To parse this JSON data, do
//
//     final rickMorty = rickMortyFromJson(jsonString);

RickMorty rickMortyFromJson(String str) => RickMorty.fromJson(json.decode(str));

String rickMortyToJson(RickMorty data) => json.encode(data.toJson());

class RickMorty {
  final Data data;

  RickMorty({
    required this.data,
  });

  factory RickMorty.fromJson(Map<String, dynamic> json) => RickMorty(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final Characters characters;

  Data({
    required this.characters,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        characters: Characters.fromJson(json["characters"]),
      );

  Map<String, dynamic> toJson() => {
        "characters": characters.toJson(),
      };
}

class Characters {
  final List<Result> results;

  Characters({
    required this.results,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  final String id;
  final String name;
  final String image;
  final Status status;
  final Location location;

  Result({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.location,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        status: statusValues.map[json["status"]]!,
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "status": statusValues.reverse[status],
        "location": location.toJson(),
      };
}

class Location {
  final String id;
  final String name;
  final String type;
  final Dimension dimension;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: dimensionValues.map[json["dimension"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimensionValues.reverse[dimension],
      };
}

enum Dimension {
  DIMENSION_C_137,
  REPLACEMENT_DIMENSION,
  TESTICLE_MONSTER_DIMENSION,
  UNKNOWN
}

final dimensionValues = EnumValues({
  "Dimension C-137": Dimension.DIMENSION_C_137,
  "Replacement Dimension": Dimension.REPLACEMENT_DIMENSION,
  "Testicle Monster Dimension": Dimension.TESTICLE_MONSTER_DIMENSION,
  "unknown": Dimension.UNKNOWN
});

enum Status { ALIVE, DEAD, UNKNOWN }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
