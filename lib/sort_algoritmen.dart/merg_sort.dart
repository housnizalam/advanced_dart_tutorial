void main() {
  final List<int> unsortierendeList = [7, 6, 5, 4, 3, 2, 1];
  final List<int> fastSortierendeList = [3, 2, 1, 4, 5, 6, 7];
  final List<int> sortierendeList = [1, 2, 3, 4, 5, 6, 7];

  final list = unsortierendeList;
  print("Unsorted list: $list");
  mergeSort(list);
  print("Sorted list: $list");
}

void mergeSort(List<int> list) {
   print('Teilungprozess startet');
  if (list.length <= 1) return;

  int mid = list.length ~/ 2;
  List<int> left = list.sublist(0, mid);
  List<int> right = list.sublist(mid);

  print('List: $list');
  print('Left: $left');
  print('Right: $right');

  mergeSort(left);
  mergeSort(right);

  merge(list, left, right);
}

void merge(List<int> list, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;
 print('Merging process start');
    print('List: $list');
    print('Left: $left');
    print('Right: $right');
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      list[k++] = left[i++];
    } else {
      list[k++] = right[j++];
    }
  }

  while (i < left.length) {
    list[k++] = left[i++];
  }

  while (j < right.length) {
    list[k++] = right[j++];
  }
    print('List: $list');
  
}
