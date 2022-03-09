import 'package:flutter/material.dart';

class AppAssets {
  static const String aamirkhan = "assets/aamir_khan.webp";
  static const String srk = "assets/srk_image.webp";
  static const String heroAlam = "assets/hero_alom.webp";
  static const String hypnotize1 = "assets/hypnotize1.webp";
  static const String hypnotize2 = "assets/hypnotize2.webp";
  static const String hypnotize3 = "assets/hypnotize3.webp";
  static const String cartoonImage1 = "assets/tom-jerry.webp";
  static const String cartoonImage2 = "assets/oggy.webp";
  static const String cartoonImage3 = "assets/motu-patlu.webp";

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
