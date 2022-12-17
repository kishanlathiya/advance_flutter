import 'package:app_settings/app_settings.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'global.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  Duration totalDuration = Duration.zero;
  double pitch = 1.1;
  double normal = 1.0;

  MyAudio() async {
    await Global.s['asset audio'].open(
      Audio(Global.s['song']),
      autoStart: false,
    );

    setState(() {
      Global.s['totalDuration'] =
          Global.s['asset audio'].current.value!.audio.duration;
    });
  }

  bool isPlaying = false;
  bool isRandom = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyAudio();
  }

  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: IconButton(
          onPressed: () async {
            await res['asset audio'].pause();
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            size: 30,
          ),
        ),
        title: const Text(
          "Music World",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${res['name']}",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Text(
              "${res['singer']}",
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(res['images']),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Weekend",
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: res['asset audio'].currentPosition,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    Duration? currentPosition = snapshot.data;
                    var duration = res['totalDuration'];

                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "$currentPosition".split(".")[0].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 180),
                            Text(
                              "$duration".split(".")[0].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 360,
                          child: Slider(
                            activeColor: Colors.green,
                            inactiveColor: Colors.lightGreen,
                            thumbColor: Colors.green,
                            min: 0,
                            max: res['totalDuration'].inSeconds.toDouble(),
                            value: currentPosition!.inSeconds.toDouble(),
                            onChanged: (val) async {
                              await res['asset audio']
                                  .seek(Duration(seconds: val.toInt()));
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () async {
                                await res['asset audio']
                                    .seekBy(const Duration(seconds: -5));
                              },
                              icon: const Icon(
                                Icons.skip_previous,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                            SizedBox(
                              height: 90,
                              width: 80,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  backgroundColor: Colors.green,
                                  elevation: 20,
                                  enableFeedback: true,
                                  highlightElevation: 20,
                                  splashColor: Colors.yellow,
                                  isExtended: true,
                                  mini: false,
                                  onPressed: () async {
                                    setState(() {
                                      isPlaying = (isPlaying) ? false : true;
                                    });
                                    (isPlaying)
                                        ? await res['asset audio'].play()
                                        : await res['asset audio'].pause();
                                  },
                                  child: (isPlaying)
                                      ? const Icon(
                                          Icons.pause,
                                          color: Colors.white,
                                          size: 50,
                                        )
                                      : const Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () async {
                                await res['asset audio']
                                    .seekBy(const Duration(seconds: 5));
                              },
                              icon: const Icon(
                                Icons.skip_next,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
