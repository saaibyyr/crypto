import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoryViewer extends StatelessWidget {
  final String imageUrl;

  const StoryViewer({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

class CryptoStories extends StatelessWidget {
  const CryptoStories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Истории',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('stories').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final stories = snapshot.data!.docs;

          return ListView.builder(
            itemCount: stories.length,
            itemBuilder: (BuildContext context, int index) {
              // Получаем данные из Firebase
              final story = stories[index];
              final name = story['name'];
              final profileImage = story['profileImage'];
              final storiesImage = story['storiesImage'];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoryViewer(imageUrl: storiesImage),
                    ),
                  );

                  Future.delayed(Duration(seconds: 3), () {
                    Navigator.pop(context);
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(profileImage),
                    ),
                    title: Text(name),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
