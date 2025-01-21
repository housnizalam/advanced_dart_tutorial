void main() async {
  // getNum();
  final int? data = await databearBeitung(17);
  print('data: $data');

  // data.onError(
  //   (error, stackTrace) {
  //     print('error');
  //     return 'error: $error';
  //   },
  // );

  // data.whenComplete(() {
  //   print('data loaded');
  // });
  // print('loading...');
  // data.timeout(Duration(seconds: 1), onTimeout: () {
  //   print('timeout');
  //   return 'timeout';
  // });
}

Future<int?> databearBeitung(int num) async {
  // on Loading
  print('loading...');

  // Try to fetch data
  final data =  getData(num);
  // ignore: void_checks
   data.whenComplete(() {
    try {
      if (num.isNegative) {
        throw Exception('num is negative');
      }
      print('data loaded');
    } catch (e) {
      // on Error
      print('error: $e');
      return null;
    }
  });
  // on Success
  return data;
}

Future<int> getNum() async {
  print('Anfrage wird gesendet');
  await Future.delayed(Duration(seconds: 1), () {
    print('data gekommen');
  });
  print('Widget bua');
  return 1;
}

Future<int> getData(int num) async {
  await Future.delayed(Duration(seconds: 2));

  return num;
}
