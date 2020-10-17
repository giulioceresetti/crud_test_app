// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:crud_test_app/business/gestione_elemento.dart';
import 'package:crud_test_app/model/elemento.dart';
import 'package:crud_test_app/model/spesa.dart';

void main() {
  GestioneElemento gest = new GestioneElemento();
  String message;
  Spesa spesa = new Spesa("punto SMA", "sma");
  Spesa spesa2 = new Spesa("conad", "sma");
  Spesa spesa3 = new Spesa("herrypo", "sma");

  message = gest.addSpesa(spesa);
  print(message);
  message = gest.addSpesa(spesa2);
  print(message);
  message = gest.addSpesa(spesa3);
  print(message);


  for(Spesa s in gest.getSpese()) {
    if(s == spesa2) {
      s.addElementoLista( new Elemento("ciao" , "giulio " ,1));
    }

    if(s == spesa3) {
      s.addElementoLista( new Elemento("ciao2" , "giorgia " ,1));
    }
  }


  for(Spesa sp in gest.getSpese()) {
    print(sp.nomeLista);
    for(Elemento e in sp.lista) {
      print(e.nome);
    }

  }
}
