import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YoutubePlayVideo extends StatefulWidget {
  const YoutubePlayVideo(this.idVideo,{Key? key}) : super(key: key);
  final String idVideo ;

  @override
  State<YoutubePlayVideo> createState() => _YoutubePlayVideoState();
}

class _YoutubePlayVideoState extends State<YoutubePlayVideo> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late double screenWidth,screenHeigh;
  @override
  void initState() {

    _controller = YoutubePlayerController(
      initialVideoId:widget.idVideo,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();

  }


  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    screenWidth=MediaQuery.of(context).size.width;
    screenHeigh=MediaQuery.of(context).size.height;
    return Scaffold(
      body:Align(
        alignment: Alignment.center,
        child: FittedBox(
          fit: BoxFit.fill,
          child: YoutubePlayer(
            aspectRatio: screenWidth / screenHeigh,
            controller: _controller,

          ),
        ),
      )

    );
  }

}
