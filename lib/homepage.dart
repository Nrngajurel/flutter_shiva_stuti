import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  play() async {
    int result = await audioPlayer.play('assets/audio/nagendra_haraya.mp3',
        isLocal: true);
    if (result == 1) {
      setState(() {
        isPlaying = true;
      });
    }
  }

  stop() async {
    int result = await audioPlayer.stop();
    if (result == 1) {
      setState(() {
        isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Nagendra Haraya"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/nagendra_haraya.jpg',
                height: height * 0.8,
                width: width * 0.9,
                fit: BoxFit.cover,
              ),
              IconButton(
                onPressed: isPlaying ? stop : play,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
