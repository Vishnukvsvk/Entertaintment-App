import 'package:flutter/material.dart';
import 'online.dart';
import 'offline.dart';
import 'Songs.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    Center(
      child: Online(),
    ),
    Center(
      child: Offline(),
    ),
    Center(
      child: Songs(),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Entertaintment App"),
            actions: [
              Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                    child: Icon(AntDesign.linkedin_square),
                    onTap: () {
                      launch(
                          "https://www.linkedin.com/in/vishnu-kvs-69aa25151/");
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: GestureDetector(
                    child: Icon(AntDesign.medium_monogram),
                    onTap: () {
                      launch("https://medium.com/@kvs.vishnu23");
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                child: GestureDetector(
                    child: Icon(AntDesign.github),
                    onTap: () {
                      launch("https://github.com/Vishnukvsvk");
                    }),
              ),
            ],
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            iconSize: 25,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  title: Text("Youtube Videos")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.video_label), title: Text("Offline Videos")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.audiotrack), title: Text("Songs")),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ));
  }
}
