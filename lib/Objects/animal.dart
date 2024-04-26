import 'package:flutter/cupertino.dart';

class Animal {
  final String? name;
  final Image? image;
  final String? query;
  bool isFavorite;

  Animal({this.name, this.image, this.query, this.isFavorite = false});
}

//

List<Animal> birdList = [
  Animal(
      name: 'Macaw Parrot',
      image: Image.asset('images/macaw.png'),
      query: 'Macaw'),
  Animal(name: 'Eagle', image: Image.asset('images/eagle.png'), query: 'Eagle'),
  Animal(
      name: 'Kiwi',
      image: Image.asset('images/kiwi.png'),
      query: 'Kiwi (bird)'),
  Animal(
      name: 'Seagull', image: Image.asset('images/seagull.png'), query: 'Gull'),
];

List<Animal> domesticAnimalList = [
  Animal(
    name: 'Cat',
    image: Image.asset('images/cat.png'),
    query: 'Cat',
    isFavorite: true,
  ),
  Animal(
    name: 'Dog',
    image: Image.asset('images/doggo.png'),
    query: 'Dog',
  ),
];

List<Animal> farmAnimalList = [
  Animal(
    name: 'Cow',
    image: Image.asset('images/cow.png'),
    query: 'Cattle',
  ),
  Animal(
    name: 'Chicken',
    image: Image.asset('images/chicken.png'),
    query: 'Chicken',
  ),
  Animal(
    name: 'Pig',
    image: Image.asset('images/pig.png'),
    query: 'Pig',
  ),
];
