import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nrn_shivastuti/Models/bhajan.dart';

class SingleBhajan extends StatefulWidget {
  final Bhajan bhajan;
  SingleBhajan({Key? key, required this.bhajan}) : super(key: key);

  @override
  State<SingleBhajan> createState() => _SingleBhajanState();
}

class _SingleBhajanState extends State<SingleBhajan> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  play() async {
    int result = await audioPlayer.play(
      widget.bhajan.audioUrl,
      isLocal: true,
    );
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

  pause() async {
    await audioPlayer.pause();
  }

  backward() async {
    await audioPlayer.seek(const Duration(seconds: -10));
  }

  forward() async {
    await audioPlayer.seek(const Duration(seconds: 10));
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
            stop();
            Navigator.pop(context);
          },
        ),
        title: Text(widget.bhajan.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.bhajan.imageUrl,
                  height: height * 0.7,
                  width: width * 0.9,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                widget.bhajan.name,
                style: TextStyle(
                  fontSize: height * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              //slider
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: backward,
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  IconButton(
                    onPressed: isPlaying ? pause : play,
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: forward,
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
