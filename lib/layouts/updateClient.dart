import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
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
SingleValueDropDownController _sexoControlller =
    SingleValueDropDownController();
TextEditingController _tipoController = TextEditingController();
TextEditingController _usuarioController = TextEditingController();

class UpdateClient extends StatefulWidget {
  final dynamic documentSnapshot;
  const UpdateClient({Key? key, this.documentSnapshot}) : super(key: key);

  @override
  State<UpdateClient> createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  final _clientes = FirebaseFirestore.instance.collection("clientes");

  @override
  void initState() {
    // TODO: implement initState
    _clientes.doc(widget.documentSnapshot.id.toString()).get();

    _cedulaController = TextEditingController.fromValue(TextEditingValue(
        text: widget.documentSnapshot['cedula'].toString(),
        selection: TextSelection.fromPosition(TextPosition(
            offset: widget.documentSnapshot['cedula'].toString().length))));

    _firsNameController = TextEditingController.fromValue(TextEditingValue(
        text: widget.documentSnapshot['nombre'],
        selection: TextSelection.fromPosition(
            TextPosition(offset: widget.documentSnapshot['nombre'].length))));

    _lastNameController = TextEditingController.fromValue(TextEditingValue(
        text: widget.documentSnapshot['apellido'],
        selection: TextSelection.fromPosition(
            TextPosition(offset: widget.documentSnapshot['apellido'].length))));
    _sexoControlller = SingleValueDropDownController(
        data: DropDownValueModel(
            name: widget.documentSnapshot['sexo'],
            value: widget.documentSnapshot['sexo']));
    _fechaNacimientoController = TextEditingController.fromValue(
        TextEditingValue(
            text: widget.documentSnapshot['fecha_nacimiento'],
            selection: TextSelection.fromPosition(TextPosition(
                offset: widget.documentSnapshot['fecha_nacimiento'].length))));

    _tipoController = TextEditingController.fromValue(TextEditingValue(
        text: widget.documentSnapshot['tipo'],
        selection: TextSelection.fromPosition(
            TextPosition(offset: widget.documentSnapshot['tipo'].length))));

    _usuarioController = TextEditingController.fromValue(TextEditingValue(
        text: widget.documentSnapshot['usuario'],
        selection: TextSelection.fromPosition(
            TextPosition(offset: widget.documentSnapshot['usuario'].length))));
    super.initState();
  }

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
                    )
                  ],
                ),
              ),
              //CONTAINTER LABEL

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _cedulaController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
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
                  onChanged: (value) {
                    _firsNameController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
                  controller: _firsNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFirstName,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) {
                    _lastNameController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
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
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    _fechaNacimientoController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
                  controller: _fechaNacimientoController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFechaNacimiento,
                  ),
                ),
              ),

              //CONTAINTER LABEL

              //CONTAINTER LABEL
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: DropDownTextField(
                  // initialValue: widget.documentSnapshot['sexo'],
                  dropDownItemCount: 3,
                  dropDownList: [
                    DropDownValueModel(name: "Hombre", value: "Hombre"),
                    DropDownValueModel(name: "Mujer", value: "Mujer")
                  ],
                  validator: (value) {
                    if (value == null) {
                      return "required field";
                    } else {
                      return null;
                    }
                  },
                  controller: _sexoControlller,
                  textFieldDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblSexo,
                  ),
                ),
              ),

              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                child: TextField(
                  onChanged: (value) {
                    _tipoController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
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
                  onChanged: (value) {
                    _usuarioController.value = TextEditingValue(
                      text: value,
                      selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length)),
                    );
                  },
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
                        final String sexo =
                            _sexoControlller.dropDownValue?.value;
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
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 3),
                              content: Text("Cliente Actualizado"),
                            ),
                          );
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
