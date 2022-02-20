import 'package:flutter/cupertino.dart';

class ObjectsModel {
  Offset defaultPosition;
  Offset currentPosition;
  int defaultIndex;
  int currentIndex;
  Size size;
  Image image;
  bool empty;
  ObjectsModel({
    required this.defaultPosition,
    required this.currentPosition,
    required this.defaultIndex,
    required this.currentIndex,
    required this.size,
     required this.image,
    this.empty = false,
  });
}
