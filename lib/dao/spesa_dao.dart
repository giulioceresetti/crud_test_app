import 'package:crud_test_app/model/spesa.dart';

class SpesaDAO {
  List<Spesa> spese;

  SpesaDAO() {
    spese = new List<Spesa>();
  }

  addSpesa(Spesa elem) {
    spese.add(elem);
  }

  bool removeSpesa(Spesa spesa) {
    spese.remove(spesa);
  }


  List<Spesa> getList() {
    return spese;
  }
}
