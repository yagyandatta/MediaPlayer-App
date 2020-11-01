import 'package:flutter/material.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tune-U"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        // color: Colors.amberAccent,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/man.jpg"),
            fit: BoxFit.fitHeight,
            ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: RaisedButton(
                    child: Text("music"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/music");
                    }),
              ),
              Container(
                height: 50,
              ),
              Container(
                child: RaisedButton(
                    child: Text("video"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/vhome");
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
