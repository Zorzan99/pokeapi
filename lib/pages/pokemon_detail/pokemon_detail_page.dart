import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokeapi/models/pokemon_model.dart';
import 'package:pokeapi/pages/widgets/get_type_colors.dart';

class PokemonDetailsPage extends StatefulWidget {
  final PokemonModel pokemon;

  const PokemonDetailsPage({super.key, required this.pokemon});

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: GetTypeColors().getColorForType(widget.pokemon.type![0]),
      appBar: AppBar(
        backgroundColor:
            GetTypeColors().getColorForType(widget.pokemon.type![0]),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Text(widget.pokemon.name ?? ''),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  width: sizeWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    widget.pokemon.type![0],
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.pokemon.type!.length > 1,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    width: sizeWidth * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.pokemon.type!.length > 1
                          ? widget.pokemon.type![1]
                          : '',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height *
                          0.3), // Ajuste o espaçamento conforme necessário
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      TabBar(
                        tabAlignment: TabAlignment.center,
                        isScrollable: true,
                        controller: _tabController,
                        tabs: const [
                          Tab(text: 'About'),
                          Tab(text: 'Evolutions'),
                          Tab(text: 'Weaknesses'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            // Conteúdo da aba "About"
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Species:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.pokemon.type![0],
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Height:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.pokemon.height.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Weight:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.pokemon.weight.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Egg:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        widget.pokemon.egg ?? '',
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Conteúdo da aba "Evolution"
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  const Text('Evolutions'),
                                  Text(
                                    widget.pokemon.nextevolution!
                                        .map((evolution) => evolution.name)
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  const Text('Weaknesses'),
                                  Text(
                                    widget.pokemon.weaknesses!
                                        .map((weaknesses) => weaknesses)
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 230,
                  child: CachedNetworkImage(
                    imageUrl: widget.pokemon.img ?? '',
                    height: 230,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
