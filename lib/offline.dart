import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewieListItem extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoInitialize: true, //First frame of video display
      looping: widget.looping, //for loopinf

      //For errors
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class Offline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChewieListItem(
          videoPlayerController:
              VideoPlayerController.asset('assets/videos/samsung.mp4'),
          looping: true,
        ),
        SizedBox(width: 10),
        ChewieListItem(
          videoPlayerController:
              VideoPlayerController.asset('assets/videos/ipad.mp4'),
          looping: true,
        ),
        SizedBox(width: 10),
        ChewieListItem(
          videoPlayerController:
              VideoPlayerController.asset('assets/videos/xiomi.mp4'),
          looping: true,
        ),
      ],
    );
  }
}
