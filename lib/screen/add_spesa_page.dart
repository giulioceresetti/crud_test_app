// Define a custom Form widget.

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

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
    CollectionReference spesa = FirebaseFirestore.instance.collection('spesa');

    Future<String> addSpesa() {
      // Call the user's CollectionReference to add a new user
      return spesa
          .add({
            'nome': nome, // John Doe
            'supermercato': superMark
          })
          .then((value){ return "spesa aggiunta";})
          .catchError((error) => print("Aggiunta spesa fallita: $error"));
    }

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
              },onChanged: (value) {
                nome = value;
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
              },onChanged: (val) {
                superMark = val;
            }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FlatButton(
                onPressed: () {
                   addSpesa().then((value) => showToast(value,gravity:Toast.BOTTOM));

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
  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}


