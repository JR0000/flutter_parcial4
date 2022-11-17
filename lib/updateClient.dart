import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String titulo = "Actualizar Cliente";

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

class UpdateClient extends StatefulWidget {
  final dynamic documentSnapshot;
  const UpdateClient({Key? key, required this.documentSnapshot})
      : super(key: key);

  @override
  State<UpdateClient> createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  final _clientes = FirebaseFirestore.instance.collection("clientes");
  @override
  Widget build(BuildContext context) {
    _clientes.doc(widget.documentSnapshot.id.toString()).get();

    TextEditingController _cedulaController = TextEditingController(
        text: widget.documentSnapshot['cedula'].toString());
    TextEditingController _firsNameController =
        TextEditingController(text: widget.documentSnapshot['nombre']);
    TextEditingController _lastNameController =
        TextEditingController(text: widget.documentSnapshot['apellido']);
    TextEditingController _fechaNacimientoController = TextEditingController(
        text: widget.documentSnapshot['fecha_nacimiento']);
    TextEditingController _sexoControlller =
        TextEditingController(text: widget.documentSnapshot['sexo']);
    TextEditingController _tipoController =
        TextEditingController(text: widget.documentSnapshot['tipo']);
    TextEditingController _usuarioController =
        TextEditingController(text: widget.documentSnapshot['usuario']);

    // _cedulaController.text = widget.documentSnapshot['cedula'].toString();
    // _firsNameController.text = widget.documentSnapshot['nombre'];
    // _lastNameController.text = widget.documentSnapshot['apellido'];
    // _fechaNacimientoController.text =
    //     widget.documentSnapshot['fecha_nacimiento'];
    // _sexoControlller.text = widget.documentSnapshot['sexo'];
    // _tipoController.text = widget.documentSnapshot['tipo'];
    // _usuarioController.text = widget.documentSnapshot['usuario'];

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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _cedulaController.text = value,
                  controller: _cedulaController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblCedula,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _firsNameController.text = value,
                  controller: _firsNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFirstName,
                  ),
                ),
              ),
              //CONTAINTER LABEL

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _lastNameController.text = value,
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblLastName,
                  ),
                ),
              ),
              //CONTAINTER LABEL

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _fechaNacimientoController.text = value,
                  controller: _fechaNacimientoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFechaNacimiento,
                  ),
                ),
              ),

              //CONTAINTER LABEL

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _sexoControlller.text = value,
                  controller: _sexoControlller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblSexo,
                  ),
                ),
              ), //CONTAINTER LABEL

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _tipoController.text = value,
                  controller: _tipoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblTipo,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) => _usuarioController.text = value,
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblUsuario,
                  ),
                ),
              ),
              // BUTTON
              Container(
                  height: 70,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: ElevatedButton(
                      child: const Text('Actualizar Cliente'),
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
                          debugPrint("Dentro del if");
                          debugPrint(
                              "$cedula-$nombre-$apellido-$fechaNacimiento-$sexo-$tipo-$usuario");
                          await _clientes
                              .doc(widget.documentSnapshot.id)
                              .update({
                            "cedula": cedula,
                            "nombre": nombre,
                            "apellido": apellido,
                            "fecha_nacimiento": fechaNacimiento,
                            "sexo": sexo,
                            "tipo": tipo,
                            "usuario": usuario
                          });
                          //Navigator.pop(context);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
