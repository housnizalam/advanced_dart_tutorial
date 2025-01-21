import 'dart:async';

Stream<int> countStream(int from, int to) async* {
  // for loop, der von from bis to zählt
  for (int i = from; i <= to; i++) {
    // yield gibt den Wert i zurück wie ein return, aber der Stream läuft weiter
    yield i;
    // definiert eine Verzögerung von eine Sekunde
    await Future.delayed(Duration(milliseconds: 300));
  }
}

StreamController<String> _controller = StreamController<String>.broadcast();
Stream<String> get out => _controller.stream;
StreamController<int> _controller2 = StreamController<int>.broadcast();
Stream<int> get out2 => _controller2.stream;

Future<void> main() async {
  //
  out.listen((event) {
    print(event);
  });
  out
      .map(
        (event) => event.replaceAll('l', 'k'),
      )
      .listen(print);
  _controller.sink.add('Hallo');
  _controller.sink.add('Welt');

  // await _controller2.sink.addStream(Stream<int>.fromIterable(
  //   List.generate(10, (i) => i),
  // ));

  out2.listen(print).onDone(() {
    print('done');
  });
  // mit addStream können wir einen Stream in einen anderen Stream einfügen
  await _controller2.sink.addStream(countStream(1, 10));
  // man kann mehrere Streams einfügen
  await _controller2.sink.addStream(countStream(11, 15));
  // man kann auch einzelne Elemente einfügen
  _controller2.sink.add(16);

  // Stream schließen schützt vor weiteren Einfügungen
  await _controller.close();
  await _controller2.close();

  // _controller2.sink.add(16);// Error: StreamController has been closed, so cannot add more elements
}
