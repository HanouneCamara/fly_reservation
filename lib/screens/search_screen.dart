import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30.0),
        backgroundColor: AppConstants.primaryColor,
        title: const Text(
          'Résultats de recherche',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 100.0,
      ),
      body: StreamBuilder(
        // Utilisation de StreamBuilder pour surveiller les changements dans la collection 'vol' de Firestore
        stream: FirebaseFirestore.instance.collection('vol').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            // Affiche un indicateur de chargement si les données ne sont pas encore disponibles
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // Récupération des documents de la collection 'vol'
          var documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              // Récupération des données spécifiques pour chaque document
              var document = documents[index].data();
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 25, right: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${document['A partir de']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 100),
                          const Icon(FontAwesomeIcons.plane, color: AppConstants.primaryColor, size: 25,),
                          const SizedBox(width: 100),
                          Text(
                            '${document['A']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),  // Ajout d'un espacement

                      // Nouvelle section avec Container
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Couleur de fond grise
                          borderRadius: BorderRadius.circular(20), // Bordures arrondies
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${document['heure']}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(width: 140),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        '${document['prix']}',
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('${document['Date']}'),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text('${document['type']}'),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('${document['passagers']}'),
                                    const SizedBox(width: 10),
                                    Text('${document['classe']}'),
                                    const SizedBox(width: 115),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppConstants.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25), 
                                        ),
                                      ),
                                      child: const SizedBox(
                                        width: 80, 
                                        height: 40, 
                                        child: Center(
                                          child: Text(
                                            'Choisir',
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white
                                            ), 
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
