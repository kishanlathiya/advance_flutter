import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  forVideoCategory() {
    Global.videoOnes = [];

    for (int i = 0; i < Global.videoList.length; i++) {
      if (Global.videoList[i]["category"] ==
          Global.videoCategory[Global.index]["category"]) {
        Global.videoOnes.add(Global.videoList[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Video Player"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: Global.videoCategory.length,
        separatorBuilder: (context, i) => const SizedBox(height: 15),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            setState(() {
              Global.index = i;
              forVideoCategory();
            });
            Navigator.of(context).pushNamed("/");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
            height: 200,
            // color: Colors.black,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("${Global.videoCategory[i]["images"]}"),
              ),
            ),
            child: Text(
              "${Global.videoCategory[i]["category"]}",
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
