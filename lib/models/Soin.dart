// ignore_for_file: file_names

import 'dart:core';

class Soin {
  String name;
  String animal;
  String date;
  String duree;
  String frequency;
  String description;
  String selectedDateDebut;
  String selectedDateFin;
  String selectedSoigneur;

  Soin({
    required this.name,
    required this.date,
    required this.duree,
    required this.frequency,
    required this.description,
    required this.animal,
    required this.selectedDateDebut,
    required this.selectedDateFin,
    required this.selectedSoigneur,
  });
}
