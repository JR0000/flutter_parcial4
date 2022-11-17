import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:parcial4/newClient.dart';
import 'package:parcial4/services/catalogos.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');
  @override
  Widget build(BuildContext context) {
    print("Inicio **************************");
    Catalogos catalogos = new Catalogos();
    catalogos.getDataAvion();
    catalogos.getDataDestinos();
    catalogos.getDataHorarios();
    catalogos.getDataHorarios();
    catalogos.getDataReservas();
    catalogos.getDataReservas();
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
  Future<void> _delete(String clientesId) async {
    await _clientes.doc(clientesId).delete();
  }
}
