import 'package:crud_test_app/model/elemento.dart';

class Spesa {
  String nomeLista;
  String nomeMarket;
  List<Elemento> lista;


  Spesa(String nome, String market) {
    this.nomeLista = nome;
    this.nomeMarket = market;
    lista = new List<Elemento>();
  }



  addElementoLista(Elemento elem) {
    lista.add(elem);
  }

  bool removeElementoLista(Elemento elem) {
    return lista.remove(elem);
  }


}