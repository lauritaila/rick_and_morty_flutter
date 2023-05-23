import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../provider/character_provider.dart';

class PersonajesCard extends StatelessWidget {
  final Map character;
  const PersonajesCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(24, 20, 24, 20),
      elevation: 0,
      color: const Color.fromRGBO(25, 24, 37, 1),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 32, bottom: 32, left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(character['image']),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              character['name'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              character['species'].toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
            ),
            const SizedBox(height: 30),
            MaterialButton(
              height: 66,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              color: const Color.fromRGBO(36, 34, 53, 1),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText('Ver perfil',
                        colors: const [
                          Color.fromRGBO(0, 245, 160, 1),
                          Color.fromRGBO(0, 217, 245, 1)
                        ],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 10),
                    ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(0, 245, 160, 1),
                            Color.fromRGBO(0, 217, 245, 1)
                          ],
                        ).createShader(bounds);
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    )
                  ]),
              onPressed: () async {
                var provider =
                    Provider.of<CharacterProvider>(context, listen: false);
                await provider.charecterList(character: character);
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, '/character');
              },
            )
          ],
        ),
      ),
    );
  }
}
