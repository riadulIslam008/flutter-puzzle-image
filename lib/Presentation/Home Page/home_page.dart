import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_colors.dart';
import 'package:flutter_pluzzle/Core/assets.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/Widgets/bootom_modal_sheet.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/Widgets/custome_text.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/Widgets/my_puzzle_section.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/Widgets/title_image_section.dart';
import 'package:flutter_pluzzle/Theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AppAssets.initImages(AppAssets.heroImageAssets, AppAssets.heroImageList);
    AppAssets.initImages(
        AppAssets.hypnotizeImageAssets, AppAssets.hypnotizeImageList);
    AppAssets.initImages(
        AppAssets.cartoonImageAssets, AppAssets.cartoonImageList);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    AppAssets.cacheImages(AppAssets.heroImageList, context);
    AppAssets.cacheImages(AppAssets.hypnotizeImageList, context);
    AppAssets.cacheImages(AppAssets.cartoonImageList, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparentColor,
          elevation: 0,
          title: Text("Puzzle Hack", style: Themes.textTheme.headline1),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                onPressed: () => bottomModelSheetUI(context),
                icon: const Icon(Icons.info_outline,
                    color: AppColors.black54Color, size: 30),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 15),
                      CustomeHeadingText(title: "My Puzzle"),
                      Spacer(),
                      MyPuzzleSection(),
                    ],
                  ),
                ),
                AssetImageSection(
                  images: AppAssets.cartoonImageList,
                  title: "Cartoon Images",
                ),
                AssetImageSection(
                  images: AppAssets.heroImageList,
                  title: "Hero Images",
                ),
                AssetImageSection(
                  images: AppAssets.hypnotizeImageList,
                  title: "Hypnotize Images",
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
