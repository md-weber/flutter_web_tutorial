import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddYoutuberCardWidget extends StatelessWidget {
  final GlobalKey<FormState> youtubeKey = GlobalKey<FormState>();
  final TextEditingController nameYoutube = TextEditingController();
  final TextEditingController urlYoutube = TextEditingController();
  final TextEditingController imageUrlYoutube = TextEditingController();
  final TextEditingController descriptionYoutube = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Add your favorite Youtuber!",
                style: TextStyle(fontSize: 32),
              ),
              Form(
                key: youtubeKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Name of the Youtuber"),
                      controller: nameYoutube,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Youtuber Description"),
                      controller: descriptionYoutube,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: "Url of the Youtube"),
                      controller: urlYoutube,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Image Url of the Youtuber"),
                      controller: imageUrlYoutube,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  child: Text("Add your Youtuber to the list!"),
                  onPressed: () {
                    if (youtubeKey.currentState.validate()) {
                      Firestore.instance.collection("channels").add({
                        "name": nameYoutube.text,
                        "description": descriptionYoutube.text,
                        "imageUrl": imageUrlYoutube.text,
                        "url": urlYoutube.text,
                      });
                    }

                    nameYoutube.clear();
                    descriptionYoutube.clear();
                    imageUrlYoutube.clear();
                    urlYoutube.clear();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
