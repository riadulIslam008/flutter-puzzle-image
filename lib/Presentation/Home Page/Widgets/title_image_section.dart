
import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Presentation/Flutter%20%20Pluzzle/pluzzle_page.dart';
import 'package:flutter_pluzzle/Presentation/Home%20Page/Widgets/custome_text.dart';
import 'package:flutter_pluzzle/main.dart';

class AssetImageSection extends StatelessWidget {
  const AssetImageSection({
    Key? key,
    required this.images,
    required this.title,
  }) : super(key: key);

  final List images;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          CustomeHeadingText(title: title),
          const Spacer(),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                for (var image in images)
                  InkWell(
                    onTap: () {
                      pageNavigation(context, PluzzlePage(imageWidget: image, heroTage: image.toString()));
                    },
                    child: Container(
                      height: 150,
                      width: 170,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Hero(
                        tag:  image.toString(),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: image,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}