import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'song_model_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "RAINBOW MUSIC",
          style: TextStyle(color: Colors.white, fontSize: 26),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: songs
                  .map((e) => MusicBox(
                        data: e,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MusicBox extends StatefulWidget {
  MusicBox({Key? key, required this.data}) : super(key: key);
  Song data;

  @override
  State<MusicBox> createState() => _MusicBoxState();
}

class _MusicBoxState extends State<MusicBox> {
  final assetsAudioPlayer = AssetsAudioPlayer();
  double songDurationInSeconds = 0;
  String songDuration = "0:0:0";

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Playlist(
          audios: songs.map((e) => Audio(e.song)).toList(),
          startIndex: songs.indexOf(widget.data)),
      autoStart: false,
    );
    assetsAudioPlayer.current.listen((Playing? playing) {
      songDuration = playing!.audio.duration.toString().split(".")[0];
      songDurationInSeconds = playing.audio.duration.inSeconds.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            songIndex = songs.indexOf(widget.data);
            Navigator.pushNamed(context, "player");
          },
          child: Container(
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: widget.data.color,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45.withOpacity(0.15),
                    offset: const Offset(0, 0),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                       // borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(widget.data.image),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.data.name,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.data.artist,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                const Spacer(),
                Text(songDuration),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
