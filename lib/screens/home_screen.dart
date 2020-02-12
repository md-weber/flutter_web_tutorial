import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Youtube to Flutter Explained!"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "Flutter Explained",
            style: TextStyle(fontSize: 102.0),
          ),
        ),
      ),
    );
  }
}
