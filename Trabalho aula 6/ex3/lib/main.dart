import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> listJson = jsonDecode(response.body);
      setState(() {
        posts = listJson.map((item) => Post.fromJson(item)).toList();
        isLoading = false;
      });
    }
  }

  Future<void> createPost() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    final response = await http.post(
      url,
      body: {'title': 'Novo Post', 'body': 'Conteúdo', 'userId': '1'},
    );
    _showMessage("Status: ${response.statusCode}");
  }

  Future<void> updatePost(int id) async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/$id');
    final response = await http.put(
      url,
      body: {'title': 'Editado', 'body': 'Editado', 'userId': '1'},
    );
    _showMessage("Status: ${response.statusCode}");
  }

  Future<void> deletePost(int id) async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts/$id');
    final response = await http.delete(url);
    if (response.statusCode == 200) {
      setState(() {
        posts.removeWhere((p) => p.id == id);
      });
      _showMessage("Removido com sucesso");
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSONPlaceholder CRUD')),
      floatingActionButton: FloatingActionButton(
        onPressed: createPost,
        child: Icon(Icons.add),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text("ID: ${post.id}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => updatePost(post.id),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deletePost(post.id),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
