import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_api/main/toolui.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> getdata() async {
    var dio = Dio();

    //get api ->
    var response = await dio.get("https://api.github.com/users/singhtaran1005");
    print(response.statusCode);
    //post api ->
    var res = await dio.post("http://localhost:8080/users",
        data: jsonEncode({"task": "Edit"}),
        options: Options(headers: {"Content-Type": "application/json"}));
    print(res.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            RaisedButton(
              child: Text('Make a reuqest'),
              onPressed: () {
                getdata();
              },
            ),
            Text(
              'response',
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Tools(),
                  ),
                );
              },
              child: Text('Tool ui'),
            ),
          ],
        ),
      ),
    );
  }
}
