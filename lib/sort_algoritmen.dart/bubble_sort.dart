void main() {
  final List<int> unsortierendeList = [7, 6, 5, 4, 3, 2, 1];
  final List<int> fastSortierendeList = [3, 2, 1, 4, 5, 6, 7];
  final List<int> sortierendeList = [1, 2, 3, 4, 5, 6, 7];

  final list = unsortierendeList;

  print("Unsorted list: $list");
  bubbleSort(list);
}

void bubbleSort(List<int> list) {
  int schrittenAnzahl = 0;
  int n = list.length;
  // warum n - 1?
  // Du hast 7 sitzplatze und 7 personen,
  // wenn die erste 6 pesonen in ihre sitzplatze sitzen, dann ist die letzte person auch in ihre sitzplatz
  // also die letzte person braucht nicht mehr sortiert werden
  for (int i = 0; i < n - 1; i++) {
    bool swapped = false;

    for (int j = 0; j < n - i - 1; j++) {
      schrittenAnzahl++;
      if (list[j] > list[j + 1]) {
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
        swapped = true;
      }
    }
    if (!swapped) break;
    print('Loop_1 Schritt ${i + 1}: $list');
  }
  print('Anzahl der Schritten: $schrittenAnzahl');
}

// Juventus: 70
// Real Madrid: 67
// Barcelona: 65
// Bayern Munich: 60
// Manchester United: 55
// Chelsea: 50
// Arsenal: 45
// Manchester City: 40
// Liverpool: 35
// Tottenham Hotspur: 30
// AC Milan: 25
// Inter Milan: 20
