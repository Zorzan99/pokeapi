import 'dart:convert';

import 'package:flutter/widgets.dart';

class PokemonNextEvolutionModedl {
  final String? number;
  final String? name;
  PokemonNextEvolutionModedl({
    this.number,
    this.name,
  });

  PokemonNextEvolutionModedl copyWith({
    ValueGetter<String?>? number,
    ValueGetter<String?>? name,
  }) {
    return PokemonNextEvolutionModedl(
      number: number != null ? number() : this.number,
      name: name != null ? name() : this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'name': name,
    };
  }

  factory PokemonNextEvolutionModedl.fromMap(Map<String, dynamic> map) {
    return PokemonNextEvolutionModedl(
      number: map['num'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonNextEvolutionModedl.fromJson(String source) =>
      PokemonNextEvolutionModedl.fromMap(json.decode(source));

  @override
  String toString() =>
      'PokemonNextEvolutionModedl(number: $number, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonNextEvolutionModedl &&
        other.number == number &&
        other.name == name;
  }

  @override
  int get hashCode => number.hashCode ^ name.hashCode;
}
