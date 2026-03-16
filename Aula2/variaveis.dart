void main (){
  var x = true;
  print(x is bool);
  String y = "ifsp";
  print(y is String);
  dynamic dinamico = "variavel";
  print(dinamico is String);
  dinamico = 1000.99;
  print(dinamico is num);
}