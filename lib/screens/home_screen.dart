import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/widgets/add_youtuber_card_widget.dart';
import 'package:flutter_web_tutorial/widgets/youtube_list_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Explained favorite Youtubers!"),
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: YoutubeListWidget(),
          ),
          Expanded(
            child: AddYoutuberCardWidget(),
          )
        ],
      ),
    );
  }
}
