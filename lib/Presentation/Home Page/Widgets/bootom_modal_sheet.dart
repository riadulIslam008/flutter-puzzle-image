import 'package:flutter/material.dart';
import 'package:flutter_pluzzle/Core/app_colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

Future bottomModelSheetUI(context) async => await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey[400],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Divider(
              thickness: 5,
              color: AppColors.black54Color,
              indent: MediaQuery.of(context).size.width * 0.35,
              endIndent: MediaQuery.of(context).size.width * 0.35,
            ),
            const SizedBox(height: 20),
            DrawerImtem(
                onTap: () async {
                  await launch("https://riadul.ichchaa.com");
                },
                text: "about me"),
            DrawerImtem(onTap: () {}, text: "rate this app"),
            DrawerImtem(
                onTap: () {
                  Share.share(
                      "https://play.google.com/store/games/details?id=com.riadul.playpuzzle");
                },
                text: "share this app"),
            DrawerImtem(
                onTap: () async {
                  String subject = "Puzzle App FeedBack";
                  String body = "Write here";
                  await launch(
                      'mailto:riadulislam087@gmail.com?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}');
                },
                text: "feedback"),
            DrawerImtem(onTap: () {}, text: "privacy policy"),
            DrawerImtem(onTap: () {}, text: "app version 1.0.0"),
          ],
        ),
      ),
    );

class DrawerImtem extends StatelessWidget {
  const DrawerImtem({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
