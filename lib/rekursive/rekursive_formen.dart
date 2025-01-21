void main(){}



int tailRekursive(int number, [int? result]) {
    result ??= 1;
  if(number==1) return result;
  result = result*number;
  number--;
  return tailRekursive(number, result);
// wenn number =4
// retuen tailRekursive(4,1) => tailRekursive(3,4)=> tailRekursive(2,12)=> tailRekursive(1,24)=> 24
}

int headtRekursive(int number){
  if(number==1) return 1;
  return number*headtRekursive(number-1);
}
// wenn number =4
// retuen 4*headtRekursive(3) => 4*3*headtRekursive(2)=> 4*3*2*headtRekursive(1)=> 4*3*2*1=24	
//  headtRekursive(3) = 3*headtRekursive(2) 
//  headtRekursive(2) = 2*headtRekursive(1)
//  headtRekursive(1) = 1




