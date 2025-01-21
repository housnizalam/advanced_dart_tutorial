void main() {
  final baum = Baum(blatte: 100);
  baum.rechteZweige = Baum(blatte: 50);
  baum.rechteZweige!.rechteZweige = Baum(blatte: 25);
  baum.linkeZweige = Baum(blatte: 50);
  baum.linkeZweige!.linkeZweige = Baum(blatte: 25);
  baum.linkeZweige!.rechteZweige = Baum(blatte: 25);
  baum.linkeZweige!.rechteZweige!.rechteZweige = Baum(blatte: 15);
  baum.linkeZweige!.rechteZweige!.rechteZweige!.rechteZweige = Baum(blatte: 10);
  baum.linkeZweige!.rechteZweige!.rechteZweige!.rechteZweige!.rechteZweige = Baum(blatte: 5);
  baum.linkeZweige!.rechteZweige!.rechteZweige!.rechteZweige!.linkeZweige = Baum(blatte: 5);
  print(blattenSumme(baum));
}

class Baum {
  Baum? rechteZweige;
  Baum? linkeZweige;
  int blatte;

  Baum({this.rechteZweige, this.linkeZweige,required this.blatte});


}

int blattenSumme(Baum? baum) {
  if (baum == null) return 0;
  return baum.blatte + blattenSumme(baum.linkeZweige) + blattenSumme(baum.rechteZweige);
}

//                                        baum 100
//                                      50/     \ 50
//                                     25/\25    \ 25
//                                         \15    
//                                          \10    
//                                         5/\5  
//                                               
//                                                
//                                                 

int blattenSummeMitSchleifen(Baum? baum) {
  if (baum == null) return 0;

  int summe = 0;
  List<Baum?> queue = [baum]; 

  while (queue.isNotEmpty) {
    Baum? aktuellerKnoten = queue.removeAt(0); 
    summe += aktuellerKnoten!.blatte; 


    if (aktuellerKnoten.linkeZweige != null) {
      queue.add(aktuellerKnoten.linkeZweige);
    }
    
   
    if (aktuellerKnoten.rechteZweige != null) {
      queue.add(aktuellerKnoten.rechteZweige);
    }
  }

  return summe;
}