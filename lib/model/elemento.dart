class Elemento {
  String nome;

  String descrizione;
  int numero;
  bool preso;

  Elemento(String name, String desc, int number) {
    nome = name;
    descrizione = desc;
    numero = number ;
    preso = false;
  }



  setNumber(int n) {
    numero = n;
  }

  setPreso() {
    preso = !preso;
  }
}