import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  printUrl() async {
    firebase_storage.ListResult result =
        await firebase_storage.FirebaseStorage.instance.ref().listAll();
    result.items.forEach((firebase_storage.Reference ref) async {
      print(await ref.getDownloadURL());
      _controller = VideoPlayerController.network(await ref.getDownloadURL())..initialize();
      print('Found file: $ref');
    });
  }

  @override
  void initState() {
    super.initState();
    printUrl();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: printUrl(),
        builder: (context, AsyncSnapshot snapshot) {
            return Scaffold(
              body: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            );
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
