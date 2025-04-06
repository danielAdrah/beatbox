// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_widgets/gradient_icon.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({super.key, required this.audioPlayer, required this.path});
  final AudioPlayer audioPlayer;
  final String path;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration duration = Duration();
  Duration position = Duration();
  Color rColor = Colors.grey;
  bool isPlaying = false;
  bool isCompleted = false;
  bool isRepeat = false;
  List<IconData> icons = [Icons.play_circle_fill, Icons.pause_circle_filled];

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    widget.audioPlayer.onPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
    try {
      widget.audioPlayer.setSourceAsset(widget.path);
    } catch (e) {
      print('Error playing audio: $e');
    }

    widget.audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
        if (state == PlayerState.completed) {
          setState(() {
            position = Duration.zero;
            if (isRepeat) {
              isPlaying = true;
            } else {
              isPlaying = false;
              isRepeat = false;
            }
            isCompleted = true;
          });
        }
      });
      handleCompletion();
    });
  }

  void handleCompletion() {
    if (isCompleted && !isRepeat) {
      setState(() {
        isPlaying = false;
        isCompleted = false;
        icons = [Icons.play_circle_fill];
      });
    }
  }

  Widget btnStart() {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //this button for repeat the song
        IconButton(
            onPressed: () {
              if (isRepeat == false) {
                widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
                setState(() {
                  isRepeat = true;
                  rColor = Colors.red;
                });
              } else if (isRepeat == true) {
                widget.audioPlayer.setReleaseMode(ReleaseMode.release);
                setState(() {
                  isRepeat = false;
                });
                rColor = Colors.grey;
              }
            },
            icon: const Icon(CupertinoIcons.repeat),
            color: rColor),
        //theses set of button for playing ,slowdown and fasten the music
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //-------SLOWDOWN THE MUSIC
            IconButton(
              onPressed: () {
                widget.audioPlayer.setPlaybackRate(0.5);
              },
              icon: GradientIcon(
                icon: CupertinoIcons.backward_end_fill,
                gradient: const LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                size: 50,
              ),
            ),

            //=====PLAYING THE SONG
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  widget.audioPlayer.pause();
                  setState(() {
                    isPlaying = false;
                    icons = [Icons.play_circle_fill];
                  });
                } else {
                  widget.audioPlayer.resume();
                  setState(() {
                    isPlaying = true;
                    icons = [Icons.pause_circle_filled];
                  });
                }
                // await widget.audioPlayer.play(AssetSource(widget.path));
              },
              icon: GradientIcon(
                icon: icons.first,
                gradient: const LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                size: 50,
              ),
            ),
            //=====FASTEN THE MUSIC
            IconButton(
              onPressed: () {
                widget.audioPlayer.setPlaybackRate(1.5);
              },
              icon: GradientIcon(
                icon: CupertinoIcons.forward_end_fill,
                gradient: const LinearGradient(colors: [
                  Color(0xFFda549a),
                  Color(0xFFec8572),
                ]),
                size: 50,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/img/loop.png",
            width: 20,
            height: 20,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  void changedToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.audioPlayer.seek(newDuration);
  }

  Widget slider() {
    return Slider(
      value: position.inSeconds.toDouble(),
      min: 0.0,
      max: duration.inSeconds.toDouble(),
      inactiveColor: Theme.of(context).colorScheme.tertiary,
      onChanged: (double value) {
        print(value);
        setState(() {
          changedToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          slider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 14.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  position.toString().split('.')[0],
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
                Text(
                  duration.toString().split('.')[0],
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          btnStart(),
        ],
      ),
    );
  }
}
