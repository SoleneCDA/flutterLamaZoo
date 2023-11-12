// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lama_zoo_flutter/globals/SoinsList.dart';
import 'package:lama_zoo_flutter/models/Soin.dart';
import 'package:lama_zoo_flutter/views/AddSoinView.dart';
import 'package:lama_zoo_flutter/views/HomePageView.dart';

class SoinDetailPage extends StatelessWidget {
  final Soin soin;

  const SoinDetailPage({
    super.key,
    required this.soin,
  });

  void deleteSoin(BuildContext context) {
    // Supprimer le soin
    soins.removeWhere((element) => element == soin);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        // renvoi à la page HomePageView
        builder: (context) => const HomePageView(),
      ),
    );
  }

  void editSoin(BuildContext context) {
    // Modifier le soin
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const AddSoinView(), // renvoi à la page AddSoinView
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Détails du soin'),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 16.0),
                Text(soin.animal),
                Text('Soin à effectuer: ${soin.name}'),
                Text('Date de début du soin: ${soin.selectedDateDebut}'),
                Text('Date de fin du soin: ${soin.selectedDateFin}'),
                Text(soin.duration),
                Text(soin.frequency),
                Text(soin.description),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: IconButton(
                onPressed: () {
                  deleteSoin(context); //Supprimer le soin
                },
                color: Colors.red, // Couleur du bouton rouge.
                icon: const Icon(Icons.delete), // Icône de poubelle.
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: IconButton(
                onPressed: () {
                  editSoin(context); // Modifier le soin.
                },
                color: Colors.green, // Couleur du bouton vert
                icon: const Icon(Icons.edit), // Icône crayon
              ),
            ),
          ],
        ),
      ),
    );
  }
}
