void main() {
  print(verschluesselung("hello", 39854697469));
  final text = 3;
  // 011 xor 100 = 111.
  // 111 xor 100 = 011.
  final key = 4;
  print(text ^ key ^key == text);
  final vtext = text ^ key;
  print(vtext ^ key == text);
  print(entschluesselung("39854697365 39854697368 39854697361 39854697361 39854697362", 39854697469));
  print(kaiseChiffre("hello", 5));
  print(pemutationChiffre("hello"));
  print(vignereChiffre("hello", "abc"));
  print(prufSumme("hello world"));
  // 15=3*5
  // 136117223861=104729*1299709 :: gegen 37 bits
  // 0100010 ^1101101 = 1001111
  // bool a = true;
  // bool b = true;
  // a ^ b 
}

String verschluesselung(String text, int key) {
  String newText = '';
  for (int i = 0; i < text.length; i++) {
    final int value = text.codeUnitAt(i) ^ key; // XOR mit charCode
    newText += '$value '; // Werte mit Leerzeichen trennen
  }
  return newText.trim(); // Entfernt letztes Leerzeichen
}

String entschluesselung(String verschluesselterText, int key) {
  List<String> zahlen = verschluesselterText.split(' '); // Werte zurückholen
  String originalText = '';

  for (String zahl in zahlen) {
    int originalCode = int.parse(zahl) ^ key; // XOR zurückrechnen
    originalText += String.fromCharCode(originalCode);
  }

  return originalText;
}

String kaiseChiffre(String text, int key) {
  List<String> letters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];

  List<String> newLetters = [...letters];

  if (key > letters.length) {
    key = key % letters.length;
  }
  for (int i = 0; i < key; i++) {
    newLetters.insert(0, newLetters.last);
    newLetters.removeLast();
  }

  print(newLetters);

  String result = '';

  for (int i = 0; i < text.length; i++) {
    if (letters.contains(text[i])) {
      final index = newLetters.indexOf(text[i]);
      result += letters[index];
    } else {
      result += text[i];
    }
  }

  return result;
}

String pemutationChiffre(String text) {
  final textlist = <String>[];
  for (int i = 0; i < text.length; i++) {
    textlist.add(text[i]);
  }
  textlist.shuffle();
  return textlist.join();
}

String vignereChiffre(String text, String key) {
  final Map<String, int> lettersStringKey = {
    'a': 0,
    'b': 1,
    'c': 2,
    'd': 3,
    'e': 4,
    'f': 5,
    'g': 6,
    'h': 7,
    'i': 8,
    'j': 9,
    'k': 10,
    'l': 11,
    'm': 12,
    'n': 13,
    'o': 14,
    'p': 15,
    'q': 16,
    'r': 17,
    's': 18,
    't': 19,
    'u': 20,
    'v': 21,
    'w': 22,
    'x': 23,
    'y': 24,
    'z': 25,
  };

  final Map<int, String> lettersIntKey = {
    0: 'a',
    1: 'b',
    2: 'c',
    3: 'd',
    4: 'e',
    5: 'f',
    6: 'g',
    7: 'h',
    8: 'i',
    9: 'j',
    10: 'k',
    11: 'l',
    12: 'm',
    13: 'n',
    14: 'o',
    15: 'p',
    16: 'q',
    17: 'r',
    18: 's',
    19: 't',
    20: 'u',
    21: 'v',
    22: 'w',
    23: 'x',
    24: 'y',
    25: 'z',
  };
  String result = '';

  for (int i = 0; i < text.length; i++) {
    final int textvalue = lettersStringKey[text[i]]!;
    final int keyvalue = lettersStringKey[key[i % key.length]]!;
    final int value = (textvalue + keyvalue) % 26;
    result += lettersIntKey[value]!;
  }

  return result;
}

int prufSumme(String text) {
  int summe = text.length;
  int e = 0;
  int l = 0;
  int result = 0;
  for (int i = 0; i < text.length; i++) {
    if (text[i] == 'e') {
      e++;
    }
    if (text[i] == 'l') {
      l++;
    }
  }
  result = e * l + summe;
  return result.hashCode;
}
