import 'package:fauna/Objects/reusablecard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fauna/Objects/animal.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:fauna/constants.dart';

class AnimalCatalogScreen extends StatelessWidget {
  const AnimalCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCanvasBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.heart_fill,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/favorites');
          },
        ),
        title: const Center(
          child: const Text('ANIMALS', style: kAppBarTextStyle),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) {
                  return Container(
                    height: 200.0,
                    color: Colors.transparent,
                    child: const Center(
                      child: Text(
                        "This feature is not finished yet (Developers are lazy)",
                        textScaleFactor: 2,
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
        backgroundColor: kAppBarBackgroundColor,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: ListView(children: [
          //Birds
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Birds',
              style: kHeaderTextStyle,
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //shrinkWrap: true,
              children: [
                for (Animal listItem in birdList)
                  ReUsableCard(listItem: listItem),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5),
            child: Divider(color: kPrimaryColor),
          ),
          //Domestic animals
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Domestic Animals',
              style: kHeaderTextStyle,
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //shrinkWrap: true,
              children: [
                for (Animal listItem in domesticAnimalList)
                  ReUsableCard(listItem: listItem),
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5),
            child: Divider(),
          ),
          //Farm animals
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              'Farm Animals',
              style: kHeaderTextStyle,
            ),
          ),
          Container(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //shrinkWrap: true,
              children: [
                for (Animal listItem in farmAnimalList)
                  ReUsableCard(listItem: listItem),
              ],
            ),
          ),
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 5),
            child: Divider(),
          ),
        ]),
      ),
    );
  }
}
