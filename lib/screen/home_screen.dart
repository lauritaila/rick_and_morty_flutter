import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/provider/home_provider.dart';

import '../components/personajes_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).charecterList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(36, 34, 53, 1),
        leading: Container(),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: MaterialButton(
              padding: const EdgeInsets.fromLTRB(22, 16, 18, 16),
              onPressed: () { Navigator.pushNamed(context, '/'); },
              color: const Color.fromRGBO(27, 26, 40, 1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: const Row(
                children: [
                  Text(
                    'Salir',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 11),
                  Icon(
                    Icons.logout_rounded,
                    color: Colors.white,
                    size: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: Consumer<HomeProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final todos = value.charaters;
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return  PersonajesCard(character: todo);
            },
          );
        },
      ),
    );
  }
}
