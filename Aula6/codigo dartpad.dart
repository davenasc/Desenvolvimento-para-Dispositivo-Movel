Future<Map<String, dynamic>> fetchUserOrder() {
    return Future.delayed(
      const Duration(seconds:2),
      () {
        print("enviando dados...");
        var userOrder = {"orderId": 10, "userName": "user001"};
        return userOrder;
         }
    );
}

Stream<int> countStream(int to) async* {
 for (int i = 1; i <= to; i++) {
 await Future.delayed(Duration(seconds:1));
 yield i;
 }
}


void main() async{
    var result = await fetchUserOrder();
    print("${result["orderId"]} - ${result["userName"]}");
    print('buscando dados');
    var stream = countStream(10);
    await for (final value in stream){
      print("count: ${value}");
    }
  }


