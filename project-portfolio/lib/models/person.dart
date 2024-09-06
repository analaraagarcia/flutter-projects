import 'package:flutter/material.dart';

class PersonModel {
  String name;
  String image;
  Color imageBox;
  List<String> specialties;
  String bio;
  PersonModel(
      {required this.name,
      required this.image,
      required this.imageBox,
      required this.specialties,
      required this.bio});

  static List<PersonModel> getPerson() {
    List<PersonModel> person = [];
    person.add(PersonModel(
      name: 'Ana Lara Garcia',
      image: 'assets/images/foto-ana-rosto.png',
      imageBox: const Color.fromARGB(255, 110, 223, 217).withOpacity(0.75),
      specialties: ['Mobile Developer', 'Software Engineer'],
      bio:
          'Estudante de Ciência da Computação na Unesp de Bauru, Ana adora programar e aprender linguagens e coisas novas.',
    ));
    return person;
  }
}
