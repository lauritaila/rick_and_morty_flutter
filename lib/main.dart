import 'package:flutter/material.dart';
import 'package:rick_and_morty/screen/character_screen.dart';
import 'package:rick_and_morty/screen/home_screen.dart';
import 'package:rick_and_morty/screen/login_screen.dart';
import 'firebase_options.dart';
//provider
import 'package:rick_and_morty/provider/character_provider.dart';
import 'package:rick_and_morty/provider/home_provider.dart';
import 'package:rick_and_morty/provider/login_provider.dart';
//dependencies
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: const Color.fromRGBO(18, 17, 26, 1),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
          '/': (_) => const LoginScreen(),
          '/home': (_) => const HomeScreen(),
          '/character': (_) => const CharacterScreen(),
        },
    );
  }
}
