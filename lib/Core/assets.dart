import 'package:flutter/material.dart';

class AppAssets {
  static const String aamirkhan = "assets/aamir_khan.jpg";
  static const String srk = "assets/srk_image.jpeg";
  static const String heroAlam = "assets/hero_alom.png";
  static const String hypnotize1 = "assets/hypnotize1.jpg";
  static const String hypnotize2 = "assets/hypnotize2.jpg";
  static const String hypnotize3 = "assets/hypnotize3.jpeg";
  static const String cartoonImage1 = "assets/tom-jerry.jpg";
  static const String cartoonImage2 = "assets/oggy.jpeg";
  static const String cartoonImage3 = "assets/motu-patlu.jpg";

  static const heroImageAssets = [
    aamirkhan,
    srk,
    heroAlam,
  ];

  static const hypnotizeImageAssets = [
    hypnotize2,
    hypnotize3,
    hypnotize1,
  ];

  static const cartoonImageAssets = [
    cartoonImage1,
    cartoonImage2,
    cartoonImage3,
  ];

  static List heroImageList = [];
  static List hypnotizeImageList = [];
  static List cartoonImageList = [];

  static initImages(imagesList, listWhereImageAdd) {
    for (var images in imagesList) {
      listWhereImageAdd.add(
        Image.asset(
          images,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      );
    }
  }

  static cacheImages(List images, context) {
    for (Image img in images) {
      precacheImage(img.image, context);
    }
  }
}
