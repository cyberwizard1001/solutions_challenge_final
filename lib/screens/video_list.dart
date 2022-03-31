import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_blue_example/screens/video_player.dart';
import 'package:flutter_blue_example/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active,
                      color: colors.primaryTextColor,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VideoList()));
                    },
                    icon: Icon(
                      Icons.archive,
                      color: colors.primaryTextColor,
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 20.0, right: 20.0),
              child: Text(
                'Welcome',
                style: GoogleFonts.montserrat(
                    color: colors.primaryTextColor, fontSize: 40),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getVideoData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print("DATA HERE: ");

                    if (snapshot.data.isNotEmpty)
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              elevation: 5,
                              child: ListTile(
                                contentPadding: EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                tileColor: colors.accentColor,
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => VideoApp(
                                            data: snapshot.data[index],
                                          )));
                                },
                                title: Text(
                                  snapshot.data[index].fileName,
                                  style: GoogleFonts.montserrat(
                                      color: colors.scaffoldColor),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    return Center(
                        child: CircularProgressIndicator(
                      color: colors.primaryTextColor,
                    ));
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
          ),
        ],
      ),
    );
  }
}
