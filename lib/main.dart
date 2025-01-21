import 'package:advanced_dart_tutorial/generics/main2.dart';

void main() {
  List<Raum> raeume = [
    Raum(10),
    Raum(20),
    Raum(50),
    Raum(15),
    Raum(45),
    Raum(5),
    Raum(25),
    Raum(30),
    Raum(35),
    Raum(40),
  ];

  sort(raeume);

  // for (Raum raum in raeume) {
  //   print(raum.getBelegung());
  // }

  gSort<Raum>(raeume, (a, b) => a.getBelegung().compareTo(b.getBelegung()));
}

void sort(List<Raum> raeume) {
  int n = raeume.length;

  for (int i = 0; i < n - 1; i++) {
    print('i loop');
    print('i: $i');
    for (int j = 0; j < n - 1 - i; j++) {
      print('j loop');
      print('Rang: $j => ${n - 1 - i} ');
      print('Raeume:$raeume');
      if (raeume[j].getBelegung() > raeume[j + 1].getBelegung()) {
        // Räume tauschen

        Raum temp = raeume[j];

        raeume[j] = raeume[j + 1];

        raeume[j + 1] = temp;
      }
    }
  }
}

class Raum {
  int belegung;

  Raum(this.belegung);

  int getBelegung() {
    return belegung;
  }

  @override
  String toString() {
    return 'Raum{belegung: $belegung}';
  }
}
