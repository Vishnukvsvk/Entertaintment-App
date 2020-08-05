import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Songs() {
  AudioPlayer _audioPlayer = AudioPlayer();
  var audioCache = AudioCache(fixedPlayer: _audioPlayer);
  String path = "";
  SongPlay() {
    audioCache.play(path);
  }

  return Center(
    child: Container(
      color: Colors.amber.shade200,
      child: Column(
        children: [
          Container(
              child: Image.asset(
            "assets/images/musicphoto.png",
            fit: BoxFit.cover,
          )),
          SizedBox(height: 20),
          Container(
            color: Colors.amber,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Icon(Icons.play_arrow),
                  onPressed: SongPlay,
                ),
                SizedBox(width: 10),
                RaisedButton(
                    child: Icon(Icons.pause),
                    onPressed: () {
                      _audioPlayer.pause();
                    }),
                SizedBox(width: 10),
                RaisedButton(
                    child: Icon(Icons.stop),
                    onPressed: () {
                      _audioPlayer.stop();
                    }),
              ],
            ),
          ),
          SizedBox(height: 40),
          Container(
            //color: Colors.amberAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            path = "songs/Bekhayali.mp3";
                            SongPlay();
                          },
                          child: Text("Bekhayali")),
                      RaisedButton(
                          onPressed: () {
                            path = "songs/Makhna.mp3";
                            SongPlay();
                          },
                          child: Text("Makhna")),
                    ]),
                SizedBox(height: 17),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            path = "songs/rare.mp3";
                            SongPlay();
                          },
                          child: Text("Rare")),
                      RaisedButton(
                          onPressed: () {
                            path = "songs/Taare_Ginn.mp3";
                            SongPlay();
                          },
                          child: Text("Taare Ginn")),
                    ]),
                SizedBox(height: 17),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RaisedButton(
                          onPressed: () {
                            path = "songs/becharasong.mp3";
                            SongPlay();
                          },
                          child: Text("Dil Bechara")),
                    ]),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
