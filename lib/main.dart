import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'global.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: "Home_Page",
      routes: {
        "/": (context) => const Video_Player_Page(),
        "Home_Page": (context) => const Home_Page(),
      },
    ),
  );
}

class Video_Player_Page extends StatefulWidget {
  const Video_Player_Page({Key? key}) : super(key: key);

  @override
  State<Video_Player_Page> createState() => _Video_Player_PageState();
}

class _Video_Player_PageState extends State<Video_Player_Page> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    imageLoad();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    chewieController = ChewieController(
      videoPlayerController: Global.imageVideo[index],
      autoPlay: false,
      looping: false,
    );

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Video Player"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
        itemCount: Global.videoOnes.length,
        // padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, i) => const SizedBox(height: 15),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            setState(() {
              index = i;
              chewieController = ChewieController(
                videoPlayerController: Global.imageVideo[i],
                autoPlay: true,
                looping: false,
              );
            });
          },
          child: Container(
            height: _height * 0.3,
            width: _width,
            decoration: BoxDecoration(
               color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.white),
            ),
            // padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: _width,
                  child: (i == index)
                      ? (Global.imageVideo[i].value.isInitialized)
                          ? AspectRatio(
                              aspectRatio:
                                  Global.imageVideo[i].value.aspectRatio,
                              child: (index == i)
                                  ? Chewie(controller: chewieController)
                                  : null,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            )
                      : VideoPlayer(Global.imageVideo[i]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  imageLoad() {
    Global.imageVideo = [];

    for (int i = 0; i < Global.videoOnes.length; i++) {
      videoPlayerController =
          VideoPlayerController.network("${Global.videoOnes[i]["path"]}")
            ..initialize().then((value) => setState(() {}));

      Global.imageVideo.add(videoPlayerController);
    }
  }
}
