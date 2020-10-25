import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_test_app/business/items.dart';
import 'package:flutter/material.dart';
import 'add_spesa_page.dart';

// ignore: must_be_immutable
class ListPage extends StatelessWidget {
  List<ListItem> items;
  final String title;

  ListPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference spesa = FirebaseFirestore.instance.collection('spesa');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: spesa.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(document.data()['nome']),
                subtitle: new Text(document.data()['supermercato']),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddSpesaPage(title),
            ),
          );
        },
        tooltip: 'aggiungi',
        child: Icon(Icons.add),
      ),
    );
  }
}
