import 'package:crud_test_app/dao/spesa_dao.dart';
import 'package:crud_test_app/model/spesa.dart';

import 'items.dart';

class GestioneElemento {
  SpesaDAO spesaDao;
  static GestioneElemento gest = null;
  GestioneElemento() {
    spesaDao = new SpesaDAO();
  }

 static GestioneElemento getInstance() {
    if (gest ==null) {
      gest = GestioneElemento();
    }
    return gest;
  }

  List<ListItem> getSpese() {
    var items = spesaDao.getList();
    return List<ListItem>.generate(items.length,
        (i) => MessageItem(items[i].nomeMarket, items[i].nomeLista));
  }

  String addSpesa(Spesa spesa) {
    String error = "ok";
    try {
      spesaDao.addSpesa(spesa);
    } catch (Exception) {
      error = "Errore nella aggiunta della spesa";
    }
    return error;
  }
}
