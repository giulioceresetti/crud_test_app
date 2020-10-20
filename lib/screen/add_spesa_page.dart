// Define a custom Form widget.
import 'package:crud_test_app/business/gestione_elemento.dart';
import 'package:crud_test_app/model/spesa.dart';
import 'package:flutter/material.dart';

class AddSpesaPage extends StatefulWidget {
  final String title;
  AddSpesaPage(this.title);
  @override
  AddSpesaPageState createState() {
    return AddSpesaPageState(title);
  }
}

class AddSpesaPageState extends State<AddSpesaPage> {
  final _formKey = GlobalKey<FormState>();
  String nome;
  String superMark;
  final String title;
  AddSpesaPageState(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Aggiungi un nome alla lista spesa';
                } else {
                  nome = value;
                }
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Aggiungi il supermercato';
                } else {
                  superMark = value;
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlatButton(
                onPressed: () {
                  print(nome);
                  var text = GestioneElemento.getInstance()
                      .addSpesa(Spesa(nome, superMark));
                  Navigator.pop(context);
                },
                child: Text("Aggiungi"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
