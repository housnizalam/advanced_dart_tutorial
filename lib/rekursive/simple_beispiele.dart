
void main() {
  // ruecklaeufigeZaehler(10);
  print(fakultaet(3));
  // timer(10);
  // print(listGeneratorRekursive(1, 10));
  // zaelerRukersive(1, 10);
  // print(faktoren(1024));
}

ruecklaeufigeZaehler(int number) {
  if (number == 0) return;
  print(number);
  return ruecklaeufigeZaehler(number - 1);
}

int fakultaet(int number, [int? result]) {
    result ??= 1;
  if(number==1) return result;
  result = result*number;
  number--;
  return fakultaet(number, result);
}

zaehler(int anfangszahl, int endzahl) {
  print(anfangszahl);
  if (anfangszahl < endzahl) {
    anfangszahl++;
    return zaehler(anfangszahl, endzahl);
  }
  return;
}

Future<void> timer(int number) async {
  await Future.delayed(Duration(milliseconds: 300));
  if (number == 0) return;
  print(number);
  return timer(number - 1);
}

List<int> listGenerator(int anfangszahl, int endzahl) {
  final List<int> result = [];
  for (int i = anfangszahl; i <= endzahl; i++) {
    result.add(i);
  }
  return result;
}

List<int> listGeneratorRekursive(int anfangszahl, int endzahl, [List<int>? result]) {
  if (anfangszahl > endzahl) return [];
  result = [...result ?? []];
  result.add(anfangszahl);
  anfangszahl++;
  if (anfangszahl <= endzahl) {
    return listGeneratorRekursive(anfangszahl, endzahl, result);
  }

  return result;
}

bool primzahl(int number) {
  if (number < 4) return true;
  final faktors = [];
  for (int i = 2; i <= number / 2; i++) {
    if (number % i == 0) faktors.add(i);
  }
  if (faktors.isEmpty) return true;
  return false;
}

List<int> faktoren(int number, [int faktor = 2, List<int>? result]) {
  result ??= []; // null safety
  if (primzahl(number)) {
    // primzahl hat keine faktoren
    return result;
  }
  if (number % faktor != 0) return faktoren(number, faktor + 1, result);
  result.add(faktor);
  number = number ~/ faktor;

  if (!primzahl(number)) return faktoren(number, faktor, result);
  result.add(number);
  return result;
}
