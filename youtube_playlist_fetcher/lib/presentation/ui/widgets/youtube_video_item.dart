import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/model/playlist_item.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/colors_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/sizes_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/styles_manager.dart';

class YoutubeVideoItem extends StatelessWidget {
  Snippet snippet;

  YoutubeVideoItem(this.snippet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: widthScreen * .33,
              height: widthScreen * 9 / 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(snippet.thumbnails.high.url),
                ) /*CachedNetworkImageProvider( snippet.thumbnails.high.url,)*/,
              ),
            ),
            Icon(
              Icons.play_arrow,
              color: AppColors.playArrowColor,
              size: 45,
            )
          ],
          alignment: Alignment.center,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  snippet.title,
                  style: AppStyles.textTitle1,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  snippet.description,
                  style: AppStyles.textSubTitle1,
                  maxLines: 9,
                  overflow: TextOverflow.ellipsis,
                  //  maxLines: 5,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
