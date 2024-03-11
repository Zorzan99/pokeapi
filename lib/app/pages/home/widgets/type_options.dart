import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokeapi/app/pages/home/home_cubit.dart';

class TypeOptions extends StatefulWidget {
  final String type;

  const TypeOptions({
    super.key,
    required this.type,
  });

  @override
  State<TypeOptions> createState() => _TypeOptionsState();
}

class _TypeOptionsState extends State<TypeOptions> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.type),
      onTap: () {
        Navigator.of(context).pop();
        context.read<HomeCubit>().filterPokemonsByType(widget.type);
      },
    );
  }
}
