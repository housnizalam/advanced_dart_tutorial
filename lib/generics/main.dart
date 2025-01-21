void main() {
  DyPacket dyKleidung = DyPacket(Mensch, 5.5);
  dyKleidung.show();
  PolPacket PolKlassMehr = PolPacket(Mehl(), 5);
  PolKlassMehr.show();
    Packet<Mehl, double> mehl = Packet(Mehl(), 5);
  mehl.show();
  Packet<Kleidung, int> kleidung = Packet(Kleidung(), 5);
  kleidung.show();
  Packet<Getraenk, double> getraenk = Packet(Getraenk(), 5);
  getraenk.show();
  
}

class DyPacket {
  final dynamic inhalt;
  final num menge;
  DyPacket(this.inhalt, this.menge);

  void show() {
    if (menge is int) {
      print('Menge: $menge Stuck ${inhalt.toString()}');
      return;
    }

    print('Menge: $menge Kilogramm ${inhalt.toString()}');
  }
}

class PolPacket {
  final Sache inhalt;
  final num menge;
  PolPacket(this.inhalt, this.menge);

  void show() {
    if (menge is int) {
      print('Menge: $menge Stuck ${inhalt.toString()}');
      return;
    }

    print('Menge: $menge Kilogramm ${inhalt.toString()}');
  }
}

class Packet<T, TT extends num> {
  final T inhalt;
  final TT menge;
  Packet(this.inhalt, this.menge);

  void show() {

    if (inhalt is Getraenk) {
      print('Menge: $menge Liter ${inhalt.toString()}');
      return;
    }
    if (inhalt is Kleidung) {
      print('Menge: $menge Stuck ${inhalt.toString()}');
      return;
    }
    print('Menge: $menge Kilogramm ${inhalt.toString()}');
  }
}

abstract class Sache {}

class Kleidung extends Sache {
  @override
  String toString() {
    return 'Kleidung';
  }
}

class Mehl extends Sache {
  @override
  String toString() {
    return 'Mehl';
  }
}

class Getraenk extends Sache {
  @override
  String toString() {
    return 'Getraenk';
  }
}
class Appfel extends Sache {
  @override
  String toString() {
    return 'Appfel';
  }
}

class Mensch {
  final String name;
  final String nachname;
  Mensch(this.name, this.nachname);
  @override
  String toString() {
    return 'Mensch: $name $nachname';
  }
}
