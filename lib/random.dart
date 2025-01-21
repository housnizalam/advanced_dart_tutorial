import 'dart:math';

void main() {
  final rand = Random(3);
  print(rand.nextInt(10));// 0=> 9
  // print(rand.nextInt(10));
  // print(rand.nextInt(10));
  // print(rand.nextInt(10));
  final x0 = 0;
  final x1 = nextRandNum(x0, 10);
  final x2 = nextRandNum(x1, 10);
  final x3 = nextRandNum(x2, 10);
  final x4 = nextRandNum(x3, 10);
  print('$x1, $x2, $x3, $x4');
}

int nextRandNum(int randNum, int m) {
  final a = 2;
  final c = 3;
  return (a * randNum + c) % m;// 0=> m-1
}
