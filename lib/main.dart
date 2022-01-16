import 'package:flutter/material.dart';
import 'package:jsontask/post.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Получение данных из сети'),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: FutureBuilder<Post>(

            future: futurePost,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(

                    children: <Widget> [
                      const SizedBox(
                      height: 20,
                      child: Text("Заголовок:", style: TextStyle(color: Colors.black, backgroundColor: Colors.greenAccent)),
                      ),
                      Text(snapshot.data!.title),
                      const SizedBox(
                      height: 20,
                        child: Text("Тело:", style: TextStyle(color: Colors.black, backgroundColor: Colors.greenAccent)),
                      ),
                      Text(snapshot.data!.body),
                    ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}