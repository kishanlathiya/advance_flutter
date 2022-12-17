import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Photo_slider extends StatefulWidget {
  const Photo_slider({Key? key}) : super(key: key);

  @override
  State<Photo_slider> createState() => _Photo_sliderState();
}

class _Photo_sliderState extends State<Photo_slider> {
  CarouselController buttonCarouselController = CarouselController();
  int initialPage = 0;
  bool view = false;
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    List images = res.images as List;
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text(
          "ANIME",
          style: TextStyle(letterSpacing: 2),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                view = !view;
              });
            },
            icon: const Icon(Icons.grid_view_rounded),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              height: 500.0,
              viewportFraction: 0.7,
              initialPage: initialPage,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (val, _) {
                setState(() {
                  initialPage = val;
                });
              },
              scrollDirection:
                  (view == false) ? Axis.horizontal : Axis.vertical,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...images.map((e) {
                int i = images.indexOf(e);
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        buttonCarouselController.animateToPage(i);
                      },
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color:
                              (initialPage == i) ? Colors.black : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}
