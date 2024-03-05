import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_pokemon.png',
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/loader.gif'),
            ),
          ),
          const SizedBox(height: 13),
          Center(
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Preparando Pokédex...',
                  textStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 3, // Repete apenas uma vez
            ),
          ),
        ],
      ),
    );
  }
}
