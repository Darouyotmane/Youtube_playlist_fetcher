import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/presentation/managers/my_colors.dart';
import 'package:youtube_playlist_fetcher/presentation/managers/my_styles.dart';
import 'package:youtube_playlist_fetcher/presentation/managers/my_values.dart';

class YoutubeVideoItem extends StatelessWidget {
  const YoutubeVideoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return SizedBox( height: widthScreen * 9 / 16,
      child: Card(
        elevation: MyValues.cardElevation,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MyValues.borderRadius),
            side: BorderSide(width: 0.5, color: MyColors.containerBorder)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: widthScreen * 1 / 3,
              height: widthScreen * 9 / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MyValues.borderRadius),
                color: Colors.black,
                image: const DecorationImage(
                    image: AssetImage('assets/images/screen1.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Flexible(
                child: Padding(
              padding: EdgeInsets.all(
                MyValues.padding8,
              ),
              child: Column(
                children: [
                  Text(
                    'Flutter Tutorial for Beginners #1 - Intro & Setup',
                    style: MyStyles.textTitle1,
                  ),
                  Flexible(
                    child: Text(
                      'Hey gang, in this Flutter tutorial for beginners, I\'ll give you a quick introduction to the course and Flutter itself, a preview of what we\'ll be building & finally show you how to install Flutter on your computer.',
                      style: MyStyles.textSubTitle1,
                      overflow:TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
