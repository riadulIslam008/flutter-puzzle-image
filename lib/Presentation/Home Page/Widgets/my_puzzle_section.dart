import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_colors.dart';
import 'package:flutter_pluzzle/Model/photo_model.dart';
import 'package:flutter_pluzzle/Model/utility.dart';
import 'package:flutter_pluzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
import 'package:flutter_pluzzle/Services/db_helper.dart';
import 'package:flutter_pluzzle/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class MyPuzzleSection extends StatefulWidget {
  const MyPuzzleSection({Key? key}) : super(key: key);

  @override
  _MyPuzzleSectionState createState() => _MyPuzzleSectionState();
}

class _MyPuzzleSectionState extends State<MyPuzzleSection> {
  late Image image;
  late LocalDatabase localDatabase = LocalDatabase.localDatabase;
  late List<PhotoModel> localStoragePhotos;
  late ImagePicker imagePicker;

  @override
  void initState() {
    localStoragePhotos = [];
    imagePicker = ImagePicker();
    refreshImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        localStoragePhotos[i].photoName),
                    heroTage: localStoragePhotos[i].photoName,
                  ),
                );
              },
              child: localStoragePhotos[i].photoName.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 150,
                      width: 170,
                      child: Hero(
                        tag: localStoragePhotos[i].photoName,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Utility.imageFromBase64String(
                              localStoragePhotos[i].photoName),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
        ],
      ),
    );
  }

  pickImageFromGallery() async {
    var permission = Permission.storage.request();
    if (await permission.isGranted) {
      imagePicker.pickImage(source: ImageSource.gallery).then((imagFile) async {
        String imgString = Utility.base64String(await imagFile!.readAsBytes());
        PhotoModel model = PhotoModel(id: 0, photoName: imgString);
        localDatabase.savePhoto(photoModel: model);
        refreshImages();
      });
    }
  }

  void refreshImages() {
    localDatabase.fetchPhotos().then((imgs) {
      setState(() {
        localStoragePhotos.clear();
        localStoragePhotos = imgs;
      });
    });
  }
}
