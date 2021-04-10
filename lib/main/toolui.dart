import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  Future<List<dynamic>> getData() async {
    // var dio =Dio();
    var res = await Dio().get("https://api.github.com/users/singhtaran1005");
    return jsonDecode(res.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "error",
              ),
            );
          } else if (snapshot.hasData) {
            print(snapshot.data);
            return Center(
              child: Text("contains data"),
            );
          }
        },
        future: getData(),
      ),
    );
  }
}
