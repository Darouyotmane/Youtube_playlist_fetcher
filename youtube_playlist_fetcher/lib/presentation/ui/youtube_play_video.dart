import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class YoutubePlayVideo extends StatefulWidget {
  const YoutubePlayVideo(this.idVideo,{Key? key}) : super(key: key);
  final String idVideo ;

  @override
  State<YoutubePlayVideo> createState() => _YoutubePlayVideoState();
}

class _YoutubePlayVideoState extends State<YoutubePlayVideo> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: '4gzJ4QLbYDw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    super.initState();
  }
  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
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
    return Scaffold(

      body:Container(
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.fill,
            child: YoutubePlayer(
              aspectRatio: 9 / 16,
              controller: _controller,

            ),
          ),
        ),
      )

     /* ListView(
        children: [
          player,
          *//*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _space,
                _text('Title', _videoMetaData.title),
                _space,
                _text('Channel', _videoMetaData.author),
                _space,
                _text('Video Id', _videoMetaData.videoId),
                _space,
                Row(
                  children: [
                    _text(
                      'Playback Quality',
                      _controller.value.playbackQuality ?? '',
                    ),
                    const Spacer(),
                    _text(
                      'Playback Rate',
                      '${_controller.value.playbackRate}x  ',
                    ),
                  ],
                ),
                _space,
                TextField(
                  enabled: _isPlayerReady,
                  controller: _idController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter youtube \<video id\> or \<link\>',
                    fillColor: Colors.blueAccent.withAlpha(20),
                    filled: true,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _idController.clear(),
                    ),
                  ),
                ),
                _space,
                Row(
                  children: [
                    _loadCueButton('LOAD'),
                    const SizedBox(width: 10.0),
                    _loadCueButton('CUE'),
                  ],
                ),
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.skip_previous),
                      onPressed:  null,
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: _isPlayerReady
                          ? () {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                        setState(() {});
                      }
                          : null,
                    ),
                    IconButton(
                      icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                      onPressed: _isPlayerReady
                          ? () {
                        _muted
                            ? _controller.unMute()
                            : _controller.mute();
                        setState(() {
                          _muted = !_muted;
                        });
                      }
                          : null,
                    ),
                    FullScreenButton(
                      controller: _controller,
                      color: Colors.blueAccent,
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next),
                      onPressed:  null,
                    ),
                  ],
                ),
                _space,
                Row(
                  children: <Widget>[
                    const Text(
                      "Volume",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Expanded(
                      child: Slider(
                        inactiveColor: Colors.transparent,
                        value: _volume,
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        label: '${(_volume).round()}',
                        onChanged: _isPlayerReady
                            ? (value) {
                          setState(() {
                            _volume = value;
                          });
                          _controller.setVolume(_volume.round());
                        }
                            : null,
                      ),
                    ),
                  ],
                ),
                _space,
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  //  color: _getStateColor(_playerState),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _playerState.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),*//*
        ],
      ),*/
    );
  }
  Widget get _space => const SizedBox(height: 10);
  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            ) ??
                '';
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}