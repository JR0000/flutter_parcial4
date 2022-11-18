import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Catalogos {
  final CollectionReference _avion =
      FirebaseFirestore.instance.collection('avion');
  final CollectionReference _destinos =
      FirebaseFirestore.instance.collection('destinos');
  final CollectionReference _horarios =
      FirebaseFirestore.instance.collection('horarios');
  final CollectionReference _reservas =
      FirebaseFirestore.instance.collection('reservas');
  final CollectionReference _vuelos =
      FirebaseFirestore.instance.collection('vuelos');

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

    print(
        "horarios ls -------------------------- " + allData.length.toString());

    allData.forEach((element) {
      String jsonString = jsonEncode(element);
      var json = jsonDecode(jsonString);
      print(json['id_horario']);
    });

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
    // print(allData);
    return allData;
  }
}
