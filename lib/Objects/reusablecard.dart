import 'package:fauna/Screens/animal_description.dart';
import 'package:flutter/material.dart';
import 'package:fauna/Objects/animal.dart';

class ReUsableCard extends StatelessWidget {
  final Animal? listItem;

  ReUsableCard({this.listItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectedAnimal = listItem;
        Navigator.pushNamed(context, '/description');
      },
      child: Card(
        margin: EdgeInsets.all(5),
        elevation: 5,
        child: Container(
          //width: double.infinity,
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                child: Container(child: listItem?.image),
                tag: '${listItem?.name}',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  '${listItem?.name}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Merriweather',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
