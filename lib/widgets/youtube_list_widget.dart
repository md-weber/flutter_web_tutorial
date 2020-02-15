import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: StreamBuilder(
          stream: Firestore.instance.collection("channels").snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text("Error: $snapshot.error");
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                List<DocumentSnapshot> documents2 = snapshot.data.documents;
                return ListView(
                  children: documents2.map(
                    (DocumentSnapshot document) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Icon(Icons.delete_forever, size: 32.0,),
                        ),
                        key: GlobalKey(),
                        onDismissed: (direction) {
                          Firestore.instance
                              .collection("channels")
                              .document(document.documentID)
                              .delete();
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(document["imageUrl"]),
                          ),
                          title: Text(document["name"]),
                          subtitle: Text(document["description"] == null
                              ? ""
                              : document["description"]),
                          onTap: () async {
                            var url = document["url"];
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      );
                    },
                  ).toList(),
                );
            }
          },
        ),
      ),
    );
  }
}
