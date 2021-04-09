import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> getdata() async {
    var dio = Dio();
    var response =
        await dio.get("http://api.github.com/users/singhtaran1005");
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Make a reuqest'),
              onPressed: () {
                getdata();
              },
            ),
            Text(
              'response',
            ),
          ],
        ),
      ),
    );
  }
}
