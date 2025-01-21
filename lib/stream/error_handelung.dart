



Stream<int> countStream(int from, int to) async* {
  for (int i = from; i <= to; i++) {
    yield i;
    if (i == 8) throw Exception('Error');
    await Future.delayed(Duration(seconds: 1));
  }
}

void main(){
  final Stream<int> stream = countStream(1, 10);
  stream.listen(
    (int data) {
      print('data: $data');
    },
    // onError wird aufgerufen, wenn ein Fehler auftritt
    onError: (error, stackTrace) {
      print('error: $error');
    },
    onDone: () {
      print('done');
    },
  );

}