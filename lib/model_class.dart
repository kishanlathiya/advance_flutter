import 'package:flutter/material.dart';

class Detail {
  String img;
  String detail;

  Detail({
    required this.img,
    required this.detail,
  });
}

List<Detail> imageList = <Detail>[
  Detail(
      img: "images/intro1.png",
      detail:
          "We help you gain knowledge that will change your life. Participate in quiz and get discount on training"),
  Detail(
      img: "images/intro2.png",
      detail:
          "Learn a lot new skills with our interesting lessons by our courses and solve tasks"),
  Detail(
      img: "images/intro3.png",
      detail: "Choose from different types of courses with new additional every month."),
  Detail(
      img: "images/intro4.png",
      detail:
          "Let's get started"),
];
