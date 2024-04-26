import 'package:fauna/Objects/animal.dart';
import 'package:fauna/constants.dart';
import 'package:flutter/material.dart';
import 'reusablecard.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kCanvasBackgroundColor,
        appBar: AppBar(
          backgroundColor: kAppBarBackgroundColor,
          title: const Text('Favorites', style: kAppBarTextStyle),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            for (Animal listItem in birdList)
              if (listItem.isFavorite) ReUsableCard(listItem: listItem),
            for (Animal listItem in domesticAnimalList)
              if (listItem.isFavorite) ReUsableCard(listItem: listItem),
            for (Animal listItem in farmAnimalList)
              if (listItem.isFavorite) ReUsableCard(listItem: listItem),
          ],
        ),
      ),
    );
  }
}
