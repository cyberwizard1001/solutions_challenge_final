import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_blue_example/screens/video_player.dart';

import '../utils/video_data.dart';

class VideoList extends StatefulWidget {
  const VideoList({Key? key}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  getVideoData() async {
    List<VideoData> data = [];
    firebase_storage.ListResult result =
        await firebase_storage.FirebaseStorage.instance.ref().listAll();

    await Future.forEach(
        result.items,
        (Reference entry) async =>
            data.add(new VideoData(entry.name, await entry.getDownloadURL())));

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: FutureBuilder(
          future: getVideoData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print("DATA HERE: ");

              if (snapshot.data.isNotEmpty)
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => VideoApp(
                                    data: snapshot.data[index],
                                  )));
                        },
                        title: Text(snapshot.data[index].fileName),
                      ),
                    );
                  },
                );
              return Center(child: CircularProgressIndicator());
            } else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
