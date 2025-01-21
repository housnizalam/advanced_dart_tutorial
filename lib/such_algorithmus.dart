import 'dart:math';

void main() {
  // final list= [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  // final unsortierteList = [10, 9, 8, 6, 7, 5, 2, 4, 1, 3];
  final listLange = 10000;
  final List<int> sortierteList = List.generate(listLange, (index) => index + 1);
  print('liner am bestenFall ${linearSuche(1, sortierteList)}');
  print('liner am schlechtestenFall ${linearSuche(listLange, sortierteList)}');
  print('binär am bestenFall ${binaereSuche(listLange ~/ 2, sortierteList)}');
  print('binär am schlechtestenFall ${binaereSuche(listLange, sortierteList)}');
  // print('binär um Zwei ${binaereSuche(2, sortierteList)}');
  // print('schlau um Zwei ${schlauSuche(2, sortierteList)}');
}

int linearSuche(int number, List<int> list) {
  final startTime = DateTime.now();
  int durchfuehrung = 0;
  for (int i = 0; i < list.length; i++) {
    durchfuehrung++;
    if (list[i] == number) {
      final endTime = DateTime.now();
      print('linearSuche Dauer: ${endTime.difference(startTime).inMicroseconds}');
      return durchfuehrung;
    }
  }
  return -1;
}

int binaereSuche(int number, List<int> list) {
  final startTime = DateTime.now();

  int durchfuehrung = 0;
  int min = 0;
  int max = list.length - 1;
  while (min <= max) {
    durchfuehrung++;
    final int mid = min + ((max - min) ~/ 2);
    if (list[mid] == number) {
      final endTime = DateTime.now();
      print('binareSuche Dauer: ${endTime.difference(startTime).inMicroseconds}');
      return durchfuehrung;
    } else if (list[mid] < number) {
      min = mid + 1;
    } else {
      max = mid - 1;
    }
  }

  return -1;
}

int schlauSuche(int number, List<int> list) {
  if (number < (log(list.length) / log(2))) {
    return linearSuche(number, list);
  }
  return binaereSuche(number, list);
}
