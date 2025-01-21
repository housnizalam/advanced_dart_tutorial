


Stream<int> countStream(int from, int to) async* {
  for (int i = from; i <= to; i++) {
    yield i;
    await Future.delayed(Duration(milliseconds: 200));
  }
}

// await for ist eine Methode, die auf einen Stream wartet und die Daten ausgibt
void awaitFor() async {
  var sum = 0;
  await for (var value in countStream(1, 10)) {
    // print('sum: $value');
    sum += value;
  }
    print('sum: $sum');
}

void main() {
  awaitFor();
}
