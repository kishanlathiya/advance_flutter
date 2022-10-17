import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'song_model_page.dart';

class AppMusicPlayer extends StatefulWidget {
  const AppMusicPlayer({Key? key}) : super(key: key);

  @override
  State<AppMusicPlayer> createState() => _AppMusicPlayerState();
}

class _AppMusicPlayerState extends State<AppMusicPlayer> {
  bool isPlaying = true;
  final assetsAudioPlayer = AssetsAudioPlayer();
  double currentPositionInSeconds = 0;
  double songDurationInSeconds = 0;
  String currentPosition = "0:0:0";
  String songDuration = "0:0:0";

  @override
  void initState() {
    super.initState();
    assetsAudioPlayer.open(
      Playlist(
        audios: songs
            .map((e) => Audio(
                  e.song,
                  metas: Metas(
                    title: e.name,
                    artist: e.artist,
                    image:
                        MetasImage.network(e.image), //can be MetasImage.network
                  ),
                ))
            .toList(),
        startIndex: songIndex,
      ),
      showNotification: true,
      autoStart: true,
    );
    assetsAudioPlayer.current.listen((Playing? playing) {
      songDuration = playing!.audio.duration.toString().split(".")[0];
      songDurationInSeconds = playing.audio.duration.inSeconds.toDouble();
      setState(() {});
    });
    assetsAudioPlayer.currentPosition.listen((Duration? duration) {
      currentPosition = duration.toString().split(".")[0];
      currentPositionInSeconds = duration!.inSeconds.toDouble();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await assetsAudioPlayer.stop();
        return true;
      },
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(songs[songIndex].image), fit: BoxFit.cover),
            gradient: const LinearGradient(
              colors: [
                Color(0xffF9F9FB),
                Color(0xFFEFF1F3),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(songs[songIndex].image),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          blurRadius: 20,
                          offset: const Offset(0, -4),
                          spreadRadius: 0)
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                songs[songIndex].name,
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                songs[songIndex].artist,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          currentPosition,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          songDuration,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 5,
                      thumbShape: SliderComponentShape.noThumb,
                    ),
                    child: Slider(
                        thumbColor: Colors.transparent,
                        activeColor: const Color(0xff590D2B),
                        inactiveColor: const Color(0xffEFF1F7),
                        value: currentPositionInSeconds,
                        min: 0,
                        max: songDurationInSeconds,
                        onChanged: (val) {
                          setState(() {
                            assetsAudioPlayer
                                .seek(Duration(seconds: val.toInt()));
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 1,
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: () async {
                            assetsAudioPlayer.shuffle;
                          },
                          child: const Icon(
                            Icons.shuffle,
                            color: Color(0xff590D2B),
                          ),
                        ),
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: const Color(0xFFE8F0FA),
                        onPressed: () async {
                          await assetsAudioPlayer.previous();
                          if (songIndex > 0) {
                            songIndex--;
                          }
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.skip_previous,
                          color: Color(0xff590D2B),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      Transform.scale(
                        scale: 1.3,
                        child: FloatingActionButton(
                          elevation: 0,
                          backgroundColor: const Color(0xff590D2B),
                          onPressed: () async {
                            await assetsAudioPlayer.playOrPause();
                            isPlaying = !isPlaying;
                            setState(() {});
                          },
                          child: Icon(
                              (isPlaying) ? Icons.pause : Icons.play_arrow),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      FloatingActionButton(
                        elevation: 0,
                        backgroundColor: const Color(0xFFE8F0FA),
                        onPressed: () async {
                          await assetsAudioPlayer.next();
                          if (songIndex < songs.length) {
                            songIndex++;
                          }
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.skip_next,
                          color: Color(0xff590D2B),
                        ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: () async {},
                          child: const Icon(
                            Icons.loop_rounded,
                            color: Color(0xff590D2B),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
