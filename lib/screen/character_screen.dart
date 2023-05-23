import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../components/personajes_mas_card.dart';
import '../provider/character_provider.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 34, 53, 1),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
      ),
      body: Consumer<CharacterProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final character = value.charater;
          final characterList = value.characterList;
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40.0, 40, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: NetworkImage(character['image']),
                      ),
                      DecoratedBox(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0)),
                            border: GradientBoxBorder(
                                gradient: LinearGradient(colors: [
                              Color.fromRGBO(0, 245, 160, 1),
                              Color.fromRGBO(0, 217, 245, 1)
                            ]))),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: GradientText(character['id'].toString(),
                              colors: const [
                                Color.fromRGBO(0, 245, 160, 1),
                                Color.fromRGBO(0, 217, 245, 1)
                              ],
                              style: const TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Text('Species',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 5),
                Text(character['species'],
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 15),
                const Text('Created',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 5),
                Text(character['created'],
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 15),
                const Text('Episode',
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
                const SizedBox(height: 5),
                Text(value.episode,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromRGBO(255, 163, 253, 1))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_rounded,
                              color: Color.fromRGBO(255, 163, 253, 1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              character['origin']['name'],
                              style: const TextStyle(
                                  color: Color.fromRGBO(255, 163, 253, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: const Color.fromRGBO(22, 255, 0, 1))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.heart_broken_rounded,
                              color: Color.fromRGBO(22, 255, 0, 1),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              character['status'],
                              style: const TextStyle(
                                  color: Color.fromRGBO(22, 255, 0, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                const Text('Más personajes',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        fontSize: 24)),
                const SizedBox(height: 30),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    PersonajesMasCard(character: characterList[0]),
                    PersonajesMasCard(character: characterList[1]),
                    PersonajesMasCard(character: characterList[2]),
                    ]),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
