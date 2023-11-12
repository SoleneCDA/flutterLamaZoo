// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lama_zoo_flutter/globals/SoinsList.dart';
import 'package:lama_zoo_flutter/models/Soin.dart';
import 'package:lama_zoo_flutter/views/AddSoinView.dart';
import 'package:lama_zoo_flutter/views/HomePageView.dart';

class SoinDetailPage extends StatelessWidget {
  final Soin soin;
  final String pageTitle = 'Détail du Soin';

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pageTitle,
              style: const TextStyle(fontSize: 24),
            ),
          ],
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
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 80,
                    ),
                    const Icon(Icons.arrow_forward),
                    Text(
                      soin.animal.toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                _buildDetailText('Soin à effectuer:', soin.name),
                _buildDetailText(
                  'Date de début du soin:',
                  soin.selectedDateDebut,
                ),
                _buildDetailText(
                  'Date de fin du soin:',
                  soin.selectedDateFin,
                ),
                _buildDetailText(
                  'Durée total du soin:',
                  soin.duree,
                ),
                _buildDetailText(
                  'Fréquence du soin:',
                  soin.frequency,
                ),
                _buildDetailText(
                  'Description du soin:',
                  soin.description,
                ),
                _buildDetailText(
                  'Soigneur:',
                  soin.selectedSoigneur,
                ),
              ],
            ),
            Positioned(
              top: 90,
              right: 50,
              height: 300,
              width: 350,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Date: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Soigneur: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Observation: ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
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

  Widget _buildDetailText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(width: 8.0),
          Text(value),
        ],
      ),
    );
  }
}
