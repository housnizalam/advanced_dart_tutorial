Stream<int> countStream(int from, int to) async* {
  for (int i = from; i <= to; i++) {
    yield i;
    await Future.delayed(Duration(milliseconds: 200));
  }
}

Stream<int> countStreamDuplicated(int from, int to) async* {
  for (int i = from; i <= to; i++) {
    yield i;
    yield i;
    await Future.delayed(Duration(milliseconds: 200));
  }
}

// isEmpty: checks if the stream is empty
Future<void> isEmpty() async {
  if (await countStream(1, 10).isEmpty) {
    print('Stream is empty');
  } else {
    print('Stream is not empty');
  }
}

// getFirst: gets the first element of the stream
Future<void> getFirst() async {
  final int first = await countStream(1, 10).first;
  print('First: $first');
}

// getLast: gets the last element of the stream
Future<void> getLast() async {
  final int last = await countStream(1, 10).last;
  print('Last: $last');
}

// getLength: gets the length of the stream
Future<int> getLength() async {
  final int length = await countStream(1, 10).length;
  print('Length: $length');
  return length;
}

// contains: checks if the stream contains a specific element
Future<bool> contains(int num) async {
  final bool isContains = await countStream(1, 10).contains(num);
  print('Contains: $isContains');
  return isContains;
}

// single: gets the single element of the stream
void single() async {
  if (await getLength() != 1) {
    print('Single: Stream has more than one element');
    return;
  }
  // single throws an error if the stream has more than one element
  final int single = await countStream(1, 10).single;
  print('Single: $single');
}

// any: checks if any element of the stream satisfies the condition
void any(int num) async {
  final bool any = await countStream(1, 10).any((element) => element > num);
  print('Any: $any');
}

// elementAt: gets the element at the specified index
void elementAt() async {
  final int elementAt = await countStream(1, 10).elementAt(5);
  print('ElementAt: $elementAt');
}

// firstWhere: gets the first element that satisfies the condition
void firstWhere(int num) async {
// if the stream does not contain the element, firstWhere throws an error
  final int firstWhere = await countStream(1, 10).firstWhere((element) => element > num);
  print('FirstWhere: $firstWhere');
}

// lastWhere: gets the last element that satisfies the condition
void lastWhere(int num) async {
// if the stream does not contain the element, lastWhere throws an error
  final int lastWhere = await countStream(1, 10).lastWhere((element) => element > num);
  print('LastWhere: $lastWhere');
}

// singleWhere: gets the single element that satisfies the condition
void singleWhere(int num) async {
// if the stream does not contain the element, singleWhere throws an error
  final int singleWhere = await countStream(1, 10).singleWhere((element) => element > num);
  print('SingleWhere: $singleWhere');
}

// join: joins the elements of the stream into a string
void join() async {
  final String join = await countStream(1, 10).join(', ');
  print('Join: $join');
}

// toList: converts the stream into a list
void toList() async {
  final List<int> list = await countStream(1, 10).toList();
  print('List: $list');
}

// expand: expands each element of the stream into multiple elements
void expand() async {
  countStream(1, 10).expand((element) => [element, element + 10, 9, 1]).listen((event) {
    print('Expand: $event');
  });
}

// map: transforms each element of the stream
void map() async {
  countStream(1, 10).map((event) => event * 2).listen((event) {
    print('Map: $event');
  });
}

// skip: skips the first n elements of the stream
void skip() async {
  countStream(1, 10).skip(5).listen((event) {
    print('Skip: $event');
  });
}

// skipWhile: skips the elements until the condition is satisfied
// when the condition is satisfied, it starts emitting the elements, and ignores the condition
// when the condition once satisfied is not checked again.
void skipWhile() async {
  countStream(1, 10).skipWhile((element) => element < 6).listen((event) {
    print('SkipWhile: $event');
  });
}

// take: takes the first n elements of the stream
void take(int n) async {
  countStream(1, 10).take(n).listen((event) {
    print('Take: $event');
  });
}

// takeWhile: takes the elements until the condition is satisfied
// when the condition is satisfied, it stops emitting the elements, and ignores the condition
void takeWhile(int n) async {
  countStream(1, 10).takeWhile((element) => element < n).listen((event) {
    print('TakeWhile: $event');
  });
}

// where: filters the elements based on the condition
// only the elements that satisfy the condition are emitted
// wenn die alle Elemente die Bedingung nicht erfüllen, wird der Stream nichts ausgegeben
// er ergibt aber kein Fehler
void where(int n) async {
  countStream(1, 10).where((element) => element % n == 0).listen((event) {
    print('Where: $event');
  });
}

// distinct: entfernt die doppelten Elemente
void distinct() async {
  countStreamDuplicated(1, 10).distinct().listen((event) {
    print('Distinct: $event');
  });
}

void multipleOperatore() async {
  countStreamDuplicated(1, 10)
      .distinct()
      .where((element) => element % 2 == 0)
      .map(
        (event) => event * 10,
      )
      .listen((event) {
    print('Multiple Operator: $event');
  });
}

// timeout: wenn in einer bestimmten Zeit kein Wert ausgegeben wird, wird ein Fehler ausgegeben.
// wenn der Fehler nicht behandelt wird, wird ein Kompilierfehler ausgegeben
void timeOut() async {
  countStream(1, 10).timeout(Duration(milliseconds: 200)).listen(
    (event) {
      print('TimeOut: $event');
    },
    onDone: () {
      print('TimeOut: Done');
    },
    onError: (error) {
      print('TimeOut: Error');
    },
    cancelOnError: true,// wenn Fehler auftritt, wird der Stream beendet
  );
}

void main() {
  // isEmpty();
  // getFirst();
  // getLast();
  // getLength();
  // contains(11);
  // single();
  // any(16);
  // elementAt();
  // firstWhere(1);
  // lastWhere(1);
  // join();
  // toList();
  // expand();
  // map();
  // skip();
  // skipWhile();
  // take(3);
  // takeWhile(6);
  // where(3);
  // distinct();
  // multipleOperatore();
  timeOut();
}
