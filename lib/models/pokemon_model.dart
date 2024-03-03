import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'package:pokeapi/models/pokemon_next_evolution_modedl.dart';

class PokemonModel {
  final int? id;
  final String? number;
  final String? name;
  final String? img;
  final List<String>? type;
  final String? height;
  final String? weight;
  final String? candy;
  final String? candycount;
  final String? egg;
  final double? spawnchance;
  final double? avgspawns;
  final String? spawntime;
  final List<double>? multipliers;
  final List<String>? weaknesses;
  final List<PokemonNextEvolutionModedl>? nextevolution;
  PokemonModel({
    this.id,
    this.number,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candycount,
    this.egg,
    this.spawnchance,
    this.avgspawns,
    this.spawntime,
    this.multipliers,
    this.weaknesses,
    this.nextevolution,
  });

  PokemonModel copyWith({
    ValueGetter<int?>? id,
    ValueGetter<String?>? number,
    ValueGetter<String?>? name,
    ValueGetter<String?>? img,
    ValueGetter<List<String>?>? type,
    ValueGetter<String?>? height,
    ValueGetter<String?>? weight,
    ValueGetter<String?>? candy,
    ValueGetter<String?>? candycount,
    ValueGetter<String?>? egg,
    ValueGetter<double?>? spawnchance,
    ValueGetter<double?>? avgspawns,
    ValueGetter<String?>? spawntime,
    ValueGetter<List<double>?>? multipliers,
    ValueGetter<List<String>?>? weaknesses,
    ValueGetter<List<PokemonNextEvolutionModedl>?>? nextevolution,
  }) {
    return PokemonModel(
      id: id != null ? id() : this.id,
      number: number != null ? number() : this.number,
      name: name != null ? name() : this.name,
      img: img != null ? img() : this.img,
      type: type != null ? type() : this.type,
      height: height != null ? height() : this.height,
      weight: weight != null ? weight() : this.weight,
      candy: candy != null ? candy() : this.candy,
      candycount: candycount != null ? candycount() : this.candycount,
      egg: egg != null ? egg() : this.egg,
      spawnchance: spawnchance != null ? spawnchance() : this.spawnchance,
      avgspawns: avgspawns != null ? avgspawns() : this.avgspawns,
      spawntime: spawntime != null ? spawntime() : this.spawntime,
      multipliers: multipliers != null ? multipliers() : this.multipliers,
      weaknesses: weaknesses != null ? weaknesses() : this.weaknesses,
      nextevolution:
          nextevolution != null ? nextevolution() : this.nextevolution,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'number': number,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candycount': candycount,
      'egg': egg,
      'spawnchance': spawnchance,
      'avgspawns': avgspawns,
      'spawntime': spawntime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'nextevolution': nextevolution?.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'],
      number: map['num'],
      name: map['name'],
      img: map['img'],
      type: List<String>.from(map['type']),
      height: map['height'],
      weight: map['weight'],
      candy: map['candy'],
      candycount: map['candy_count']?.toString(),
      egg: map['egg'],
      spawnchance: map['spawn_chance']?.toDouble(),
      avgspawns: map['avg_spawns']?.toDouble(),
      spawntime: map['spawn_time'],
      multipliers: map['multipliers'] != null
          ? List<double>.from(map['multipliers'])
          : null,
      weaknesses: List<String>.from(map['weaknesses']),
      nextevolution: map['next_evolution'] != null
          ? List<PokemonNextEvolutionModedl>.from(map['next_evolution']
              ?.map((x) => PokemonNextEvolutionModedl.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonModel(id: $id, number: $number, name: $name, img: $img, type: $type, height: $height, weight: $weight, candy: $candy, candycount: $candycount, egg: $egg, spawnchance: $spawnchance, avgspawns: $avgspawns, spawntime: $spawntime, multipliers: $multipliers, weaknesses: $weaknesses, nextevolution: $nextevolution)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonModel &&
        other.id == id &&
        other.number == number &&
        other.name == name &&
        other.img == img &&
        listEquals(other.type, type) &&
        other.height == height &&
        other.weight == weight &&
        other.candy == candy &&
        other.candycount == candycount &&
        other.egg == egg &&
        other.spawnchance == spawnchance &&
        other.avgspawns == avgspawns &&
        other.spawntime == spawntime &&
        listEquals(other.multipliers, multipliers) &&
        listEquals(other.weaknesses, weaknesses) &&
        listEquals(other.nextevolution, nextevolution);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        number.hashCode ^
        name.hashCode ^
        img.hashCode ^
        type.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        candy.hashCode ^
        candycount.hashCode ^
        egg.hashCode ^
        spawnchance.hashCode ^
        avgspawns.hashCode ^
        spawntime.hashCode ^
        multipliers.hashCode ^
        weaknesses.hashCode ^
        nextevolution.hashCode;
  }
}
