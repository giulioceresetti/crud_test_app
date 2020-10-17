import 'package:crud_test_app/dao/spesa_dao.dart';
import 'package:crud_test_app/model/elemento.dart';
import 'package:crud_test_app/model/spesa.dart';

class GestioneElemento {
  SpesaDAO spesaDao;

  GestioneElemento() {
    spesaDao = new SpesaDAO();
  }

  List<Spesa> getSpese() {
    return spesaDao.getList();
  }

 String addSpesa(Spesa spesa) {
    String error ="ok";
    try {
      spesaDao.addSpesa(spesa);
    } catch (Exception) {
      error = "Errore nella aggiunta della spesa";
    }
    return error;
  }


}
