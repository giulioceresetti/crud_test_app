import 'package:crud_test_app/business/gestione_elemento.dart';
import 'package:crud_test_app/business/items.dart';
import 'package:flutter/material.dart';
import 'add_spesa_page.dart';

class ListPage extends StatelessWidget {
  List<ListItem> items;
  final String title;
  var gest = GestioneElemento.getInstance();

  ListPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = gest.getSpese();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
            onTap: () => {},
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
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
