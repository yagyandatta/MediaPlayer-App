import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoApp extends StatefulWidget {
  @override
  _MyVideoAppState createState() => _MyVideoAppState();
}

class _MyVideoAppState extends State<MyVideoApp> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    // "https://github.com/unos0923/musicPlayer/raw/main/myDemo.mp4");
    _controller = VideoPlayerController.asset("assets/to_the_end.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  //   void initState() {
  //   _controller = VideoPlayerController.network(
  //   "https://github.com/unos0923/musicPlayer/raw/main/myDemo.mp4");
  //   // _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true);
  //   _controller.setVolume(1.0);
  //   super.initState();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.video_library,
                color: Colors.white,
              ),
              title: Text(
                'videos',
                style: TextStyle(color: Color(0xffffffaa)),
              ),
            ),
            ListTile(
              leading: RaisedButton(
                  child: Text("to The End",),
                  onPressed: () {
                    initState();
                  }),
            ),
            ListTile(
              leading: RaisedButton(
                  child: Text("chalk warfare"),
                  onPressed: () {
                    
                  }),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
