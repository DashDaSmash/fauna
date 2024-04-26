import 'package:fauna/Objects/favorites.dart';
import 'package:fauna/Screens/animal_description.dart';
import 'package:fauna/Screens/animal_catalog_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Fauna());

class Fauna extends StatelessWidget {
  const Fauna({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const AnimalCatalogScreen(),
        //'/': (context) => HomePage(),
        //'/catalog': (context) => AnimalCatalogScreen(),
        '/description': (context) => const AnimalDescription(),
        '/favorites': (context) => const FavoriteScreen(),
      },
      // theme: ThemeData(
      //   primaryColorLight: Colors.greenAccent,
      //   primaryColorDark: Colors.green,
      //   scaffoldBackgroundColor: Colors.white70,
      // ),
    );
  }
}
