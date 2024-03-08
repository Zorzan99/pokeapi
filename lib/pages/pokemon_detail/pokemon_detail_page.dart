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
  final List<PokemonModel> pokemons = [];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                widget.pokemon.name ?? '',
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('#${widget.pokemon.number ?? ''}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 4),
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
                  const SizedBox(
                    width: 10,
                  ),
                  Visibility(
                    visible: widget.pokemon.type!.length > 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Specie:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
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
                                      const SizedBox(width: 10),
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
                                      const SizedBox(width: 10),
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
                                      const SizedBox(width: 10),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Text('Evolutions:'),
                                      const SizedBox(width: 10),
                                      Text(
                                        widget.pokemon.nextevolution != null
                                            ? widget.pokemon.nextevolution!
                                                .map((evolution) =>
                                                    evolution.name)
                                                .join(', ')
                                            : 'No evolutions',
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Weaknesses:'),
                                      const SizedBox(width: 10),
                                      Text(
                                        widget.pokemon.weaknesses![0],
                                      ),
                                    ],
                                  )
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
