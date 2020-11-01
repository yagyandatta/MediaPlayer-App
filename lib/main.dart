import 'package:flutter/material.dart';
import 'package:tune_u/myMusic.dart';
import 'package:tune_u/local.dart';
import 'package:tune_u/network.dart';
import 'package:tune_u/videoHome.dart';
import 'home.dart';


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color.fromRGBO(12, 15, 69,1),
      ),
        initialRoute: "/",

        
        routes: {
          "/": (context) => MyHome(),
          "/vid": (context) => NetworkVid(),
          "/music": (context) => MyMusicApp(),
          "/video": (context) => MyVideoApp(),
          "/vhome": (context) => Vhome(),
         
        }
  )
  );

}