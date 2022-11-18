import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:parcial4/home.dart';
import 'package:parcial4/homeCatalogos.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Parcial 4', home: Home());
  }
}
