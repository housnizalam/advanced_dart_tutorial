void main() {
  print(naechsteFahrtZaehler(8, 46));
}

String naechsteFahrtZaehler(int stunde, int aktuelleMinute) {
  if (stunde > 23 || stunde < 0) {
    stunde = 0;
  }
  List<int> abfahrtMinuten = abfahrtZeiten[stunde]!;
  if (abfahrtZeiten[stunde]!.isNotEmpty && abfahrtMinuten.last > aktuelleMinute) {
    for (int abfahrtMinute in abfahrtMinuten) {
      if (abfahrtMinute > aktuelleMinute) {
        return '$stunde:$abfahrtMinute';
      }
    }
  }
 return naechsteFahrtZaehler(stunde + 1, 0);
}



Map<int, List<int>> abfahrtZeiten = {
  0: [],
  1: [],
  2: [],
  3: [],
  4: [],
  5: [],
  6: [30],
  7: [20, 50],
  8: [10, 30, 50],
  9: [20, 50],
  10: [20, 50],
  11: [20, 50],
  12: [20, 50],
  13: [10, 30, 50],
  14: [20, 50],
  15: [20, 50],
  16: [20, 50],
  17: [10, 30, 50],
  18: [20, 50],
  19: [30],
  20: [30],
  21: [],
  22: [],
  23: [],
};

