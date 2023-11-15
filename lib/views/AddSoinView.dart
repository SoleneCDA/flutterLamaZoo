// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lama_zoo_flutter/globals/SoinsList.dart';
import 'package:lama_zoo_flutter/models/Soin.dart';
import 'package:lama_zoo_flutter/views/HomePageView.dart';

class AddSoinView extends StatefulWidget {
  const AddSoinView({Key? key}) : super(key: key);

  @override
  State<AddSoinView> createState() => _AddSoinViewState();
}

class _AddSoinViewState extends State<AddSoinView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dureeController = TextEditingController();
  //TextEditingController userName = TextEditingController();
  //TextEditingController userLastName = TextEditingController();
  DateTime? selectedDateDebut;
  DateTime? selectedDateFin;
  String selectedPosition = 'Box';
  TextEditingController descriptionController = TextEditingController();
  String animal = 'Lion';

  //String userName;
  //String userLastName;

  String pageTitle = 'Ajouter un soin';

  int calculateDuree() {
    if (selectedDateDebut != null && selectedDateFin != null) {
      Duration difference = selectedDateFin!.difference(selectedDateDebut!);
      return difference.inDays;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          pageTitle,
          style: const TextStyle(fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Sélectionnez un animal',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: animal,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    animal = newValue;
                  });
                }
              },
              items: <String>[
                'Lion',
                'Tiger',
                'Elephant',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nom du soin',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez le nom du soin';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: dateDebutController,
                    decoration: InputDecoration(
                      labelText: 'Date de début',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null &&
                          pickedDate != selectedDateDebut) {
                        setState(() {
                          selectedDateDebut = pickedDate;
                          dateDebutController.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          dureeController.text = calculateDuree().toString();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: dateFinController,
                    decoration: InputDecoration(
                      labelText: 'Date de fin',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101),
                      );

                      if (pickedDate != null && pickedDate != selectedDateFin) {
                        setState(() {
                          selectedDateFin = pickedDate;
                          dateFinController.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          dureeController.text = calculateDuree().toString();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Durée du soin (en jours)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    readOnly: true,
                    controller: dureeController,
                    // Affichez la durée actuelle calculée
                    //initialValue: calculateDuree().toString(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedPosition,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPosition = newValue!;
                });
              },
              items: <String>[
                'Box',
                'Parcelle',
                'Enclos sur parcelle',
                'Quarantaine',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description du soin',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                icon: const Icon(Icons.add),
                onPressed: () {
                  final name = nameController.text;
                  final duree =
                      selectedDateDebut != null && selectedDateFin != null
                          ? selectedDateFin!
                              .difference(selectedDateDebut!)
                              .inDays
                              .toString()
                          : 'Non disponible';
                  final position = selectedPosition;
                  final description = descriptionController.text;

                  final newSoin = Soin(
                    name: name,
                    date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    duree: duree,
                    position: position,
                    description: description,
                    animal: animal,
                    //userName: userName,
                    //userLastName: userLastName,
                    selectedDateDebut: selectedDateDebut != null
                        ? DateFormat('dd/MM/yyyy').format(selectedDateDebut!)
                        : '',
                    selectedDateFin: selectedDateFin != null
                        ? DateFormat('dd/MM/yyyy').format(selectedDateFin!)
                        : '',
                  );

                  soins.add(newSoin);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePageView(),
                    ),
                  );
                },
              ),
            ],
          )
        ]),
      ),
    );
  }
}
