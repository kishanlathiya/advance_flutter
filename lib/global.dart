import 'package:video_player/video_player.dart';

class Global {
  static List<Map> videoList = [
    {
      "Name": "A",
      "path":
          "https://media.istockphoto.com/id/1359576900/video/hummingbird-hovering-in-backlighting-sunlight-slow-motion-and-zoom-in-zoom-out.mp4?s=mp4-640x640-is&k=20&c=eBOQ6_3uYGyG9CAZagESNOAcLEqc7xR4EJM3U-ryFrE=",
      "category": "Birds",
    },
    {
      "Name": "A",
      "path":
          "https://media.istockphoto.com/id/1189760339/video/slow-motion-shot-of-swans-flying-over-blue-sky-background.mp4?s=mp4-640x640-is&k=20&c=yKSIsBodUFYRDuuGfRpsheeHaiaT7Os07YXo1zulMAE=",
      "category": "Birds",
    },
    {
      "Name": "B",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-white-cat-lying-among-the-grasses-seen-up-close-22732-large.mp4",
      "category": "Animals",
    },
    {
      "Name": "B",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-dog-catches-a-ball-in-a-river-1494-large.mp4",
      "category": "Animals",
    },
    {
      "Name": "B",
      "path":
          "https://assets.mixkit.co/videos/preview/mixkit-camels-walking-in-the-desert-4285-large.mp4",
      "category": "Animals",
    },
    {
      "Name": "C",
      "path":
          "https://media.istockphoto.com/id/1070968016/video/time-lapse-of-electronics-factory-workers-assembling-smartphone-circuit-boards-by-hand-while.mp4?s=mp4-640x640-is&k=20&c=uAJLC_NH230Qx29caEdvdknJ90ChHAPcGpGHUoHyaYs=",
      "category": "Electronics",
    },
    {
      "Name": "C",
      "path":
          "https://media.istockphoto.com/id/511126406/video/automated-circut-board-machine-produces-printed-digital-electronic-board.mp4?s=mp4-640x640-is&k=20&c=7t7AVnQL_pboL_z5ljqsxLN__YIB1FPQaeg_ZynMWL4=",
      "category": "Electronics",
    },
  ];

  static List<VideoPlayerController> imageVideo = [];

  static int index = 0;

  static List videoOnes = [];

  static List videoCategory = [
    {"category": "Birds", "images": "image/birds.jpg"},
    {"category": "Animals", "images": "image/animals.jpg"},
    {"category": "Electronics", "images": "image/electronic.jpg"},
  ];

}
