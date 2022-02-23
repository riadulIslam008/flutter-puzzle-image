import 'package:hive_flutter/adapters.dart';

part 'hive_db.g.dart';

@HiveType(typeId: 0)
class ImageStore extends HiveObject{
  ImageStore({required this.imageText});

  @HiveField(0)
  final String imageText;
}
