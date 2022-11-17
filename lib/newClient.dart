import 'package:flutter/material.dart';

String titulo = "Agregar Cliente";

String lblCedula = "Cedula";
String lblFirstName = "Nombre";
String lblLastName = "Apellido";
String lblTelefono = "Telefono";
String lblFechaNacimiento = "Fecha nacimiento";
String lblSexo = "Sexo";
String lblTipo = "Tipo";
String lblUsuario = "Usuario";

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController telefono = TextEditingController();

class NewClient extends StatefulWidget {
  const NewClient({Key? key}) : super(key: key);

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
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
                  controller: firstName,
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
                  controller: firstName,
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
                  controller: lastName,
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
                  controller: telefono,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblFechaNacimiento,
                  ),
                ),
              ),
              //CONTAINTER LABEL
              Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Text(lblTelefono),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: telefono,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: lblTelefono,
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
                  controller: telefono,
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
                  controller: telefono,
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
                  controller: telefono,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
