import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String titulo = "Agregar Cliente";

String lblCedula = "Cedula";
String lblFirstName = "Nombre";
String lblLastName = "Apellido";
String lblFechaNacimiento = "Fecha nacimiento";
String lblSexo = "Sexo";
String lblTipo = "Tipo";
String lblUsuario = "Usuario";

TextEditingController _cedulaController = TextEditingController();
TextEditingController _firsNameController = TextEditingController();
TextEditingController _lastNameController = TextEditingController();
TextEditingController _fechaNacimientoController = TextEditingController();
TextEditingController _sexoControlller = TextEditingController();
TextEditingController _tipoController = TextEditingController();
TextEditingController _usuarioController = TextEditingController();

class NewClient extends StatefulWidget {
  const NewClient({Key? key}) : super(key: key);

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection("clientes");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        // decoration: borderBlack(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  height: 70,
                  margin: const EdgeInsets.fromLTRB(15, 2, 15, 10),
                  padding: const EdgeInsets.all(0),
                  // decoration: borderBlack(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(0),
                          padding: const EdgeInsets.all(0),
                          width: MediaQuery.of(context).size.width / 2.1,
                          // decoration: borderBlack(),
                          child: Text(titulo, style: TextStyle(fontSize: 24))),
                      Container(
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width / 5,
                        // // decoration: borderBlack(),
                        // child: Container(
                        //   height: 50,
                        //   decoration: BoxDecoration(
                        //     borderRadius:
                        //         BorderRadius.all(Radius.circular(20.0)),
                        //     image: DecorationImage(
                        //       image: ExactAssetImage('assets/img/user.png'),
                        //     ),
                        //   ),
                        // ))
                      )
                    ],
                  )
                  // Text(
                  //   titulo,
                  //   style: TextStyle(fontSize: 24),
                  // ),
                  ),
              //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblCedula),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _cedulaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblCedula,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblFirstName),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  controller: _firsNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFirstName,
                  ),
                ),
              ),
              //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblLastName),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblLastName,
                  ),
                ),
              ),
              //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblFechaNacimiento),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _fechaNacimientoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFechaNacimiento,
                  ),
                ),
              ),

              //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblSexo),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _sexoControlller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblSexo,
                  ),
                ),
              ), //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblTipo),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _tipoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblTipo,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblUsuario),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblUsuario,
                  ),
                ),
              ),
              // BUTTON
              Container(
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                  child: ElevatedButton(
                      child: const Text('REGISTRARSE'),
                      onPressed: () async {
                        final int? cedula =
                            int.tryParse(_cedulaController.text);
                        final String nombre = _firsNameController.text;
                        final String apellido = _lastNameController.text;
                        final String fechaNacimiento =
                            _fechaNacimientoController.text;
                        final String sexo = _sexoControlller.text;
                        final String tipo = _tipoController.text;
                        final String usuario = _usuarioController.text;
                        if (cedula != null &&
                            nombre != null &&
                            apellido != null &&
                            fechaNacimiento != null &&
                            sexo != null &&
                            tipo != null &&
                            usuario != null) {
                          await _clientes.add({
                            "cedula": cedula,
                            "nombre": nombre,
                            "apellido": apellido,
                            "fecha_nacimiento": fechaNacimiento,
                            "sexo": sexo,
                            "tipo": tipo,
                            "usuario": usuario
                          });
                          Navigator.pop(context);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
