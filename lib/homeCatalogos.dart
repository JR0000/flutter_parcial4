import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parcial4/services/catalogos.dart';

class HomeCatalogo extends StatefulWidget {
  const HomeCatalogo({Key? key}) : super(key: key);

  @override
  State<HomeCatalogo> createState() => _HomeCatalogoState();
}

class _HomeCatalogoState extends State<HomeCatalogo> {
  @override
  Widget build(BuildContext context) {
    final CollectionReference _vuelos =
        FirebaseFirestore.instance.collection('vuelos');

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Parcial 4')),
        ),
        body: StreamBuilder(
          stream: _vuelos.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title:
                          Text("ID: " + documentSnapshot['idvuelo'].toString()),
                      subtitle: Text("Destino: " +
                          destinos(documentSnapshot['destinos_id_destinos']
                              .toString())),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                            // children: [
                            //   IconButton(
                            //       onPressed: () {
                            //         debugPrint(
                            //             documentSnapshot.data().toString());
                            //         _mostrar(documentSnapshot);
                            //       },
                            //       icon: Icon(Icons.visibility)),
                            //   IconButton(
                            //     icon: const Icon(Icons.edit),
                            //     onPressed: () {
                            //       debugPrint(documentSnapshot.data().toString());
                            //       debugPrint(documentSnapshot.id.toString());
                            //       _update(documentSnapshot);
                            //       //    Navigator.push(
                            //       //        context,
                            //       //        PageTransition(
                            //       //            child: UpdateClient(
                            //       //                client: documentSnapshot.id.toString()),
                            //       //            type: PageTransitionType.fade));
                            //       //
                            //     },
                            //   ),
                            //   IconButton(
                            //       icon: const Icon(Icons.delete),
                            //       onPressed: () => _delete(documentSnapshot.id)),
                            // ],
                            ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// agregar productos

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
    ;
  }

  String destinos(String id) {
    String idDestino = "";
    Catalogos catalogos = new Catalogos();
    catalogos.getDataDestinos().then((data) async => {
          data.forEach((element) {
            print(element['id_destino']);
            if (id.trim() == element['id_destino'].toString().trim()) {
              // print(element['id_destino'].toString());
              int id = element['id_destino'];
              idDestino = id.toString();
            }
          })
        });
    return idDestino;
  }
}
