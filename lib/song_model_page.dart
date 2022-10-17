import 'package:flutter/material.dart';

class Song {
  String name;
  String artist;
  String image;
  String song;
  Color? color;

  Song({
    required this.name,
    required this.artist,
    required this.image,
    required this.song,
    required this.color,
  });
}

int songIndex = 0;
List<Song> songs = <Song>[
  Song(
      name: "Chaand Baaliyan",
      artist: "Aditya",
      image:
          "https://a10.gaanacdn.com/images/albums/26/3814826/crop_480x480_3814826.jpg",
      song: "images/Chaand.mp3",
      color: const Color(0xff0047BD)),
  Song(
      name: "Dosti(From RRR)",
      artist: "Amit Trivedi",
      image:
          "https://i0.wp.com/www.socialnews.xyz/wp-content/uploads/2021/12/06/NTR-Jr-and-Ram-Charan-HD-Stills-and-posters-from-RRR-Movie--scaled.jpg?quality=80&zoom=1&ssl=1",
      song: "images/dosti.mp3",
      color: const Color(0xff0188D9)),
  Song(
      name: "Hosanna",
      artist: "A.R.Rahman",
      image: "https://i.scdn.co/image/ab67616d0000b273c36ca28b750c75cc69db40ea",
      song: "images/Hosanna.mp3",
      color: const Color(0xff07B8FC)),
  Song(
      name: "Devo ke Dev",
      artist: "Akki Kalyan",
      image:
          "https://www.originallyric.com/wp-content/uploads/2021/07/Devon-Ke-Dev-Mahadev-Lyrics-Akki-Kalyan.jpg",
      song: "images/mahadev.mp3",
      color: const Color(0xff009543)),
  Song(
      name: "Meri Jann Meri Jann",
      artist: "B Praak",
      image:
          "https://c.saavncdn.com/491/Bachchhan-Paandey-Hindi-2022-20220317081001-500x500.jpg",
      song: "images/Meri_jann.mp3",
      color: const Color(0xff0ABA3B)),
  Song(
      name: "Roi na",
      artist: "Ninja,Goldboy",
      image: "https://s2.dmcdn.net/v/MebdP1Q4q5kRfWMMz/x1080",
      song: "images/Roi_na.mp3",
      color: Colors.lightGreen),
  Song(
      name: "Srivalli",
      artist: "sid sriram",
      image:
          "https://c.saavncdn.com/blob/056/Pushpa-The-Rise-Telugu-2021-20211216115409-500x500.jpg",
      song: "images/Srivalli.mp3",
      color: const Color(0xff0047BD)),
  Song(
      name: "Titliaan",
      artist: "Sargun Mehta",
      image: "https://www.quirkybyte.com/wp-content/uploads/2021/01/10-7.jpg",
      song: "images/Titliaan.mp3",
      color: const Color(0xff0188D9)),
  Song(
      name: "Toofan",
      artist: "Sandesh Datta Naik",
      image:
          "https://pbs.twimg.com/media/FOWa5_-VEAE97e8?format=jpg&name=small",
      song: "images/Toofan.mp3",
      color: const Color(0xff07B8FC)),
  Song(
      name: "Tum hi Aana",
      artist: "Payal Dev",
      image:
          "https://m.media-amazon.com/images/M/MV5BY2Y1M2Y0YWEtN2FlNS00ODkwLWJhN2ItNTA0YTkzZWI4NjJhXkEyXkFqcGdeQXVyMTA5NzIyMDY5._V1_.jpg",
      song: "images/Tum_hi_aana.mp3",
      color: const Color(0xff009543)),
  Song(
      name: "Waalian",
      artist: "Divyam Agarwal",
      image:
          "https://bollyfry.in/wp-content/uploads/2020/08/Waalian-Harnoor.jpg?v=1598421759",
      song: "images/Waalian.mp3",
      color: const Color(0xff0ABA3B))
];
