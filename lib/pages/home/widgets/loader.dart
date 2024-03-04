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
          Image.network(
            'https://i.pinimg.com/originals/34/c1/e5/34c1e5d371d64a581b1902ec5c4509f4.png',
          ),
          const Center(child: CircularProgressIndicator()),
          const Center(
            child: Text(
              'Carregando...',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
