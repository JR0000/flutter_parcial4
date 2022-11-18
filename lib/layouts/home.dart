import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parcial4/layouts/newClient.dart';
import 'package:parcial4/layouts/updateClient.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  TextEditingController _cedulaController = TextEditingController();
  TextEditingController _firsNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _fechaNacimientoController = TextEditingController();
  TextEditingController _sexoControlller = TextEditingController();
  TextEditingController _tipoController = TextEditingController();
  TextEditingController _usuarioController = TextEditingController();

  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');
  @override
  Widget build(BuildContext context) {
    print("Inicio **************************");
  
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
                      subtitle: Text(documentSnapshot['nombre'].toString()),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  debugPrint(
                                      documentSnapshot.data().toString());
                                  _mostrar(documentSnapshot);
                                },
                                icon: Icon(Icons.visibility)),
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                debugPrint(documentSnapshot.data().toString());
                                debugPrint(documentSnapshot.id.toString());
                                _update(documentSnapshot);
                                //    Navigator.push(
                                //        context,
                                //        PageTransition(
                                //            child: UpdateClient(
                                //                client: documentSnapshot.id.toString()),
                                //            type: PageTransitionType.fade));
                                //
                              },
                            ),
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
              MaterialPageRoute(builder: (context) => NewClient()),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    await Navigator.push(
        context,
        PageTransition(
            child: UpdateClient(documentSnapshot: documentSnapshot),
            type: PageTransitionType.fade));
  }

  Future<void> _delete(String clientesId) async {
    await _clientes.doc(clientesId).delete();
  }

  Future<void> _mostrar([DocumentSnapshot? documentSnapshot]) async {
    documentSnapshot.toString();
    if (documentSnapshot != null) {
      _cedulaController.text = documentSnapshot['cedula'].toString();
      _firsNameController.text = documentSnapshot['nombre'].toString();
      _lastNameController.text = documentSnapshot['apellido'].toString();
      _fechaNacimientoController.text =
          documentSnapshot['fecha_nacimiento'].toString();
      _sexoControlller.text = documentSnapshot['sexo'].toString();
      _tipoController.text = documentSnapshot['tipo'].toString();
      _usuarioController.text = documentSnapshot['usuario'].toString();
    }
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsetsDirectional.zero,
          titlePadding: EdgeInsets.all(3),
          elevation: 2,
          title: Text("Datos Cliente: "),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _cedulaController,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Cedula",
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _firsNameController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nombre",
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _lastNameController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Apellido",
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _fechaNacimientoController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Fecha de Nacimiento",
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _sexoControlller,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Sexo",
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _tipoController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Tipo",
                ),
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TextField(
                controller: _usuarioController,
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Usuario",
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.red,
            )
          ],
        );
      },
    );
  }
}
