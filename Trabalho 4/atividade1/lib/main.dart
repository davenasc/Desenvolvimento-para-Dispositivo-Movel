import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: GridGalleryScreen()),
  );
}

class GridGalleryScreen extends StatelessWidget {
  final List<String> imagens = [
    'https://picsum.photos/id/10/400/600',
    'https://picsum.photos/id/1011/400/600',
    'https://picsum.photos/id/1015/400/600',
    'https://picsum.photos/id/1016/400/600',
    'https://picsum.photos/id/1018/400/600',
    'https://picsum.photos/id/1019/400/600',
  ];

  final List<String> titulos = [
    'Montanhas',
    'Canoagem',
    'Vale Verde',
    'Cânion',
    'Campo',
    'Costa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Galeria'), centerTitle: true),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: imagens.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(imagens[index], fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.transparent],
                      ),
                    ),
                    child: Text(
                      titulos[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
