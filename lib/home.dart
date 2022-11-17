import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parcial4/newClient.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');
  final CollectionReference _avion =
      FirebaseFirestore.instance.collection('avion');
  final CollectionReference _destinos =
      FirebaseFirestore.instance.collection('destinos');
  final CollectionReference _horarios =
      FirebaseFirestore.instance.collection('horarios');
  final CollectionReference _reservas =
      FirebaseFirestore.instance.collection('reservas');
  final CollectionReference _vuelos =
      FirebaseFirestore.instance.collection('vuerlos');
  @override
  Widget build(BuildContext context) {
    print("Inicio **************************");
    getDataAvion();
    getDataDestinos();
    getDataHorarios();
    getDataHorarios();
    getDataReservas();
    getDataReservas();
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Parcial 4')),
        ),
        body: StreamBuilder(
          stream: _clientes.snapshots(),
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
                      title: Text(documentSnapshot['cedula'].toString()),
                      subtitle: Text(documentSnapshot['cedula'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewClient()),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {}
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {}
  Future<void> _delete(String clientesId) async {
    await _clientes.doc(clientesId).delete();
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('collection');

  // CATALOGOS
  Future<List> getDataAvion() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _avion.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    return allData;
  }

  Future<List> getDataDestinos() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _destinos.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    return allData;
  }

  Future<List> getDataHorarios() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _horarios.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    return allData;
  }

  Future<List> getDataReservas() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _reservas.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    return allData;
  }

  Future<List> getDataVuelos() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _vuelos.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
    return allData;
  }
}
