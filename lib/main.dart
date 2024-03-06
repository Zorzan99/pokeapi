import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokeapi/api/api_base.dart';
import 'package:pokeapi/pages/home/home_cubit.dart';
import 'package:pokeapi/repository/pokemons_repository.dart';
import 'package:pokeapi/repository/pokemons_repository_impl.dart';
import 'package:pokeapi/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (context) => ApiBase(),
          ),
          Provider(
            create: (context) => Dio(),
          ),
          Provider<PokemonsRepository>(
            create: (context) => PokemonsRepositoryImpl(
              apiBase: context.read(),
              dio: context.read(),
            ),
          ),
          Provider<HomeCubit>(
            create: (context) => HomeCubit(
              context.read<PokemonsRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
            useMaterial3: true,
          ),
          initialRoute: '/',
          onGenerateRoute: AppRoutes.generateRoute,
        ));
  }
}
