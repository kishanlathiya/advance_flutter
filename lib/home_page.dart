import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  Duration totalDuration = Duration.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        leading: const Icon(
          Icons.queue_music,
          size: 30,
          color: Colors.black,
        ),
        title: const Text(
          "Audio Player",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(height: 10),
            ...Global.Songs.map(
              (e) => Column(
                children: [
                  Card(
                    color: const Color(0xff252525),
                    surfaceTintColor: Colors.white,
                    semanticContainer: true,
                    shadowColor: Colors.green,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      visualDensity: VisualDensity.standard,
                      minVerticalPadding: 10,
                      enableFeedback: true,
                      focusColor: Colors.green,
                      enabled: true,
                      selected: true,
                      onTap: () {
                        setState(() {
                          Global.s = e;
                        });
                        Navigator.of(context)
                            .pushNamed('audio_page', arguments: e);
                      },
                      isThreeLine: true,
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(e['images']),
                            )),
                      ),
                      title: Text(
                        e['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      subtitle: Text(
                        e['singer'],
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ).toList(),
          ],
        ),
      ),
    );
  }
}
