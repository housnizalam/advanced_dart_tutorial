void gSort<T>(List<T> liste, int Function(T, T) compare) {
  int n = liste.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - 1 - i; j++) {
      // Use the compare function to decide the order
      if (compare(liste[j], liste[j + 1]) > 0) {
        // Swap elements if they are in the wrong order
        T temp = liste[j];
        liste[j] = liste[j + 1];
        liste[j + 1] = temp;
      }
    }
  }
}
 
void main() {
  // Example with integers
  List<int> numbers = [5, 2, 9, 1, 5, 6];
  gSort<int>(numbers, (a, b) => a.compareTo(b));
  print('Sorted numbers: $numbers');
 
  // Example with Mitarbeiter objects
  List<Mitarbeiter> mitarbeiterList = [
    Mitarbeiter('John', 5000),
    Mitarbeiter('Jane', 7000),
    Mitarbeiter('Doe', 3000)
  ];
 
  gSort<Mitarbeiter>(mitarbeiterList, (m1, m2) => m1.getGehalt().compareTo(m2.getGehalt()));
  print('Sorted Mitarbeiter by Gehalt:');
mitarbeiterList.forEach((m) => print('${m.name}: ${m.getGehalt()}'));
}
 
// Class definition for Mitarbeiter
class Mitarbeiter {
  String name;
  double gehalt;
 
Mitarbeiter(this.name, this.gehalt);
 
  double getGehalt() => gehalt;
}