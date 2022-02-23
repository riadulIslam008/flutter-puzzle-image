import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_colors.dart';
import 'package:flutter_pluzzle/Core/app_string.dart';
import 'package:flutter_pluzzle/Model/utility.dart';
import 'package:flutter_pluzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
import 'package:flutter_pluzzle/Services/hive_db.dart';
import 'package:flutter_pluzzle/main.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MyPuzzleSection extends StatefulWidget {
  const MyPuzzleSection({Key? key}) : super(key: key);

  @override
  _MyPuzzleSectionState createState() => _MyPuzzleSectionState();
}

class _MyPuzzleSectionState extends State<MyPuzzleSection> {
  late Image image;

  late ImagePicker imagePicker;

  @override
  void initState() {
    imagePicker = ImagePicker();
    // refreshImages();
    super.initState();
  }

  @override
  void dispose() {
    //close all hive box wich i created;
    Hive.close();
    //clsoe only a box what we want
    // Hive.box(AppString.dbName).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ImageStore>>(
        valueListenable: Hive.box<ImageStore>(AppString.dbName).listenable(),
        builder: (context, box, _) {
          final localStoragePhotos = box.values.toList().cast<ImageStore>();
          return SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                const SizedBox(width: 10),
                InkWell(
                  onTap: () => pickImageFromGallery(),
                  child: SizedBox(
                    height: 100,
                    width: 120,
                    child: DottedBorder(
                      color: AppColors.black54Color,
                      strokeWidth: 3,
                      dashPattern: const [18, 6],
                      child: Center(
                        child: Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ),
                ),
                for (var i = localStoragePhotos.length - 1; i > 0; i--)
                  InkWell(
                    onTap: () {
                      pageNavigation(
                        context,
                        PluzzlePage(
                          imageWidget: Utility.imageFromBase64String(
                              localStoragePhotos[i].imageText),
                          heroTage: localStoragePhotos[i].imageText,
                        ),
                      );
                    },
                    child: localStoragePhotos[i].imageText.isNotEmpty
                        ? Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            height: 150,
                            width: 170,
                            child: Hero(
                              tag: localStoragePhotos[i].imageText,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Utility.imageFromBase64String(
                                    localStoragePhotos[i].imageText),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
              ],
            ),
          );
        });
  }

  pickImageFromGallery() async {
    var permission = Permission.storage.request();
    if (!kIsWeb && await permission.isGranted) {
      imagePicker.pickImage(source: ImageSource.gallery).then((imagFile) async {
        if (imagFile != null) {
          String imgString = Utility.base64String(await imagFile.readAsBytes());
          ImageStore _imageModel = ImageStore(imageText: imgString);
          final hiveBox = Hive.box<ImageStore>(AppString.dbName);
          hiveBox.add(_imageModel);
        }
      });
    } else if (kIsWeb) {
      imagePicker.pickImage(source: ImageSource.gallery).then((imagFile) async {
        if (imagFile != null) {
          String imgString = Utility.base64String(await imagFile.readAsBytes());
          ImageStore _imageModel = ImageStore(imageText: imgString);
          final hiveBox = Hive.box<ImageStore>(AppString.dbName);
          hiveBox.add(_imageModel);
        }
      });
    }
  }
}


// Future<PermissionStatus> requestPermission() async {
//   await Permission.storage.request();
//   return Permission.storage.status;
// }
