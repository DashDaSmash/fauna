import 'package:fauna/Objects/animal.dart';
import 'package:fauna/Objects/fetchdata.dart';
import 'package:fauna/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Animal? selectedAnimal;

class AnimalDescription extends StatefulWidget {
  const AnimalDescription({Key? key}) : super(key: key);

  @override
  State<AnimalDescription> createState() => _AnimalDescriptionState();
}

class _AnimalDescriptionState extends State<AnimalDescription> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kCanvasBackgroundColor,
        body: SafeArea(
          child: ListView(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Space on left of animal name
                    const SizedBox(width: 20),
                    //Animal name
                    Flexible(
                      //margin: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${selectedAnimal?.name}',
                          style: TextStyle(
                              fontSize: 50,
                              fontFamily: 'Merriweather-Black',
                              fontWeight: FontWeight.w900,
                              color: kPrimaryColor),
                        ),
                      ),
                    ),
                    //Heart button
                    IconButton(
                      onPressed: () => setState(() {
                        print('user clicked like button');
                        selectedAnimal?.isFavorite =
                            !(selectedAnimal?.isFavorite ?? false);
                        print(
                            '${selectedAnimal?.name} has new favorite value ${selectedAnimal?.isFavorite}');
                      }),
                      icon: selectedAnimal?.isFavorite ?? false
                          ? const Icon(CupertinoIcons.heart_fill,
                              color: Colors.red, size: 30)
                          : const Icon(CupertinoIcons.heart,
                              color: Colors.black, size: 30),
                    ),
                    //Space on right of heart
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              Hero(
                tag: '${selectedAnimal?.name}',
                child: Container(child: selectedAnimal?.image),
              ),
              const SizedBox(
                height: 20,
              ),
              const Flexible(
                child: DescriptionBox(),
              ),
              //MaterialButton(onPressed: onPressed) TODO: launch external site
            ],
          ),
        ),
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchAnimalDescription('${selectedAnimal?.query}'),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.hasError)
            return Text('Error: ${snapshot.error}');
          else {
            String descriptionText =
                snapshot.data ?? 'No description available';
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  '$descriptionText',
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontFamily: 'Gaugu',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }
}
