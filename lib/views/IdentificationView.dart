// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lama_zoo_flutter/views/HomePageView.dart';

class IdentificationView extends StatefulWidget {
  const IdentificationView({super.key});

  @override
  State<IdentificationView> createState() => _IdentificationView();
}

class _IdentificationView extends State<IdentificationView> {
  String pageTitle = 'Authentification';
  TextEditingController IdentController = TextEditingController();
  TextEditingController MdpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            child: TextFormField(
              controller: IdentController,
              decoration: InputDecoration(
                labelText: 'Identifiant',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez votre identifiant';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: MdpController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Entrez votre mot de passe';
                }
                return null;
              },
            ),
          ),
        ]),
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const HomePageView(), // renvoi à la page HomePageView
              ),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Valider'), // Titre du bouton
              Icon(
                Icons.done,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
