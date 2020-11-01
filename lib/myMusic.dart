import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';

class MyMusicApp extends StatefulWidget {
  @override
  _MyMusicAppState createState() => _MyMusicAppState();
}

class _MyMusicAppState extends State<MyMusicApp> {
  AudioPlayer musicPlayer = AudioPlayer();
  bool isPlaying = false;
  String playingtTime = "00:00";
  String totalTime = "00:00";

  Duration durationNew = new Duration();
  Duration position = new Duration();

  @override
  void initState() {
    super.initState();

    musicPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        durationNew = dd;
      });
    });
    musicPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });

    musicPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        playingtTime = duration.toString().split(".")[0];
      });
    });
    musicPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        totalTime = duration.toString().split(".")[0];
      });
    });
  }

  seekAudio() async {
    int response = await musicPlayer.seek(Duration(milliseconds: 0));
    if (response == 1) {
      // success
    }
  }

  play() async {
    int result = await musicPlayer.play(
        'https://github.com/unos0923/musicPlayer/raw/main/in%20the%20end.mp3');
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
      // success
    }
  }

  play1() async {
    int result = await musicPlayer.play(
        'https://github.com/unos0923/musicPlayer/raw/main/i%20stil%20think%20of%20u.mp3');
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
      // success
    }
  }

  Widget slider() {
    return Slider(
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: durationNew.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            musicPlayer.seek(new Duration(seconds: value.toInt()));
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
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
                Icons.queue_music,
                color: Colors.white,
              ),
              title: Text(
                'play from url',
                style: TextStyle(color: Color(0xffffffaa)),
              ),
            ),
            ListTile(
              leading: RaisedButton(
                  child: Text("In The End",),
                  onPressed: () {
                    play();
                  }),
            ),
            ListTile(
              leading: RaisedButton(
                  child: Text("I still think of U"),
                  onPressed: () {
                    play1();
                  }),
            ),
          ],
        ),
      ),

      // body part

      body: Center(
        child: Column(
          children: [
            Container(
              height: 75,
              width: double.infinity,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  image: const DecorationImage(
                    image: AssetImage("assets/player.gif"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black38,
                    width: 6,
                  ),
                  borderRadius: BorderRadius.circular(200)),
            ),

            // time
            Container(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    playingtTime,
                    style: new TextStyle(
                        color: Color(0xFF84A2AF), fontWeight: FontWeight.bold),
                  ),
                  Text(
                    totalTime,
                    style: new TextStyle(
                        color: Color(0xFF84A2AF), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            slider(), // Audio progress bar

            // play/pause buttons
            Container(
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(Icons.replay),
                        iconSize: 30,
                        color: Colors.white,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          print("replay clicked");
                          seekAudio();
                          setState(() {
                            isPlaying = true;
                          });
                        }),
                    IconButton(
                        icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: 30,
                        color: Colors.white,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          print("play pause");
                          if (isPlaying) {
                            musicPlayer.pause();

                            setState(() {
                              isPlaying = false;
                            });
                          } else {
                            musicPlayer.resume();

                            setState(() {
                              isPlaying = true;
                            });
                          }
                        }),
                    IconButton(
                        icon: Icon(Icons.stop),
                        iconSize: 30,
                        color: Colors.white,
                        splashColor: Colors.blueGrey,
                        onPressed: () {
                          print("stoped");
                          musicPlayer.stop();
                          setState(() {
                            isPlaying = false;
                          });
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_box),
          onPressed: () async {
            String fromLocal = await FilePicker.getFilePath();
            int status = await musicPlayer.play(fromLocal, isLocal: true);
            if (status == 1) {
              setState(() {
                isPlaying = true;
              });
            }
          }),
    );
  }
}
