import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialPageIndex = 0;
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Education App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CarouselSlider.builder(
              carouselController: buttonCarouselController,
              options: CarouselOptions(
                height: 600,
                onPageChanged: (i, carouselPageChangedReason) {
                  setState(() {
                    initialPageIndex = i;
                  });
                },
                autoPlay: false,
                viewportFraction: 1,
                aspectRatio: 3.0,
                initialPage: 0,
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
                  Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(imageList[i].img),
                      fit: BoxFit.fill,
                    )),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imageList[i].detail,
                      style:
                          const TextStyle(color: Colors.black54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("login_page");
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
                Row(
                  children: imageList
                      .map((e) => InkWell(
                            onTap: () {
                              setState(() {
                                initialPageIndex = imageList.indexOf(e);
                                buttonCarouselController
                                    .jumpToPage(initialPageIndex);
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 5,
                                backgroundColor:
                                    (initialPageIndex == imageList.indexOf(e))
                                        ? Colors.blue
                                        : Colors.grey,
                              ),
                            ),
                          ))
                      .toList(),
                ),
                TextButton(
                  onPressed: () {
                    initialPageIndex++;
                    buttonCarouselController.jumpToPage(initialPageIndex++);
                    setState(() {});
                    if (initialPageIndex == 3) {
                      Navigator.of(context).pushReplacementNamed("login_page");
                    }
                  },
                  child: (initialPageIndex == 3)
                      ? Text(
                          "Get Started",
                          style: TextStyle(fontSize: 18),
                        )
                      : Text(
                          "Next",
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
