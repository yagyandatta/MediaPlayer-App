import 'package:flutter/material.dart';

class Vhome extends StatefulWidget {
  @override
  _VhomeState createState() => _VhomeState();
}

class _VhomeState extends State<Vhome> {
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
                  child: Text(
                    "From Local",
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/video");
                  }),
            ),
            ListTile(
              leading: RaisedButton(
                  child: Text("From URL"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/vid");
                  }),
            ),
          ],
        ),
      ),
      body:Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/video.gif"),
            fit: BoxFit.fitHeight,
            ),
        ),
      ),
    );
  }
}
