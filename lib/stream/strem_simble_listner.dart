// das ist ein integer Stream der von from bis to zählt
// async* ist ein Generator, der eine Stream erstellt
import 'dart:async';

Stream<int> countStream(int from, int to) async* {
  // for loop, der von from bis to zählt
  for (int i = from; i <= to; i++) {
    // yield gibt den Wert i zurück wie ein return, aber der Stream läuft weiter
    yield i;
    // definiert eine Verzögerung von eine Sekunde
    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<String> StringStream(List<String> stringList) async* {
  for (String e in stringList) {
    yield e;

    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  // erstellt einen Stream von 1 bis 10
  final Stream<int> stream = countStream(1, 10);
  // hört auf den Stream und gibt die Daten aus
  final StreamSubscription intStremSub = stream.listen((int data) {
    // print('data: $data');
  });

  final Stream<String> stringStream = StringStream(['A', 'B', 'C', 'D', 'E']);
  final StreamSubscription stringStreamSub = stringStream.listen(
    (event) {
      print(event);
    },
    // onDone wird aufgerufen, wenn der Stream fertig ist
  );

  //  final StreamSubscription stringStreamSub2=stream.listen((int data) {
  //   // print('data: $data');
  // });  // Error: Stream kann nur einmal gehört werden

  intStremSub.onData((data) {
    print(data);
    if (data == 3) {
      stringStreamSub.pause();
    }
    if (data == 7) {
      stringStreamSub.resume();
    }
  });
}
