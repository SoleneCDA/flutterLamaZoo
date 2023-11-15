// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lama_zoo_flutter/globals/SoinsList.dart';
import 'package:lama_zoo_flutter/views/AddsoinView.dart';
import 'package:lama_zoo_flutter/views/IdentificationView.dart';
import 'package:lama_zoo_flutter/views/soinDetailPage.dart';

class HomePageView extends StatefulWidget {
  //final String userName;
  //final String userLastName;
  const HomePageView({
    super.key,
  });

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  String pageTitle = 'Parc Lama Zoo';

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
            child: IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IdentificationView(),
                  ),
                );
              },
              tooltip: 'Déconnexion',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('dd/MM/yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          //   Padding(
          //  padding: const EdgeInsets.all(8.0),
          //  child: Text(
          //    'Bonjour $userName $userLastName',
          //    style: const TextStyle(fontSize: 24),
          //  ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            "Bienvenue",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
              //liste des soins contenus dans la liste soins
              padding: const EdgeInsets.all(8),
              itemCount: soins.length,
              itemBuilder: (context, index) {
                final soin = soins[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      //permet d'appuyer sur le nom du soin pour voir le détail
                      context,
                      MaterialPageRoute(
                        // renvoi à la page soinDetailPage
                        builder: (context) => SoinDetailPage(
                          soin: soin,
                        ),
                      ),
                    );
                  },
                  shape: OutlineInputBorder(
                    // bordure pour chaque soin + radius
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(soin.animal), // ne montre que le nom du soin
                  subtitle: Text(soin.name),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
          // bouton pour pouvoir ajouter un soin dans la liste soins
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AddSoinView(), // renvoi à la page AddSoinView
              ),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Ajouter un nouveau soin'), // Titre du bouton
              Icon(
                Icons.arrow_forward, // Icône fleche droite
              ),
            ],
          ),
        ),
      ),
    );
  }
}
