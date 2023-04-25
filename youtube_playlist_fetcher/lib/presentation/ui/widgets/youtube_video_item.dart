import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_playlist_fetcher/data/model/guide_item.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/colors_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/sizes_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ressources/styles_manager.dart';
import 'package:youtube_playlist_fetcher/presentation/ui/youtube_play_video.dart';

class YoutubeVideoItem extends StatelessWidget {
  Snippet snippet;
  ContentDetails contentDetails;


  YoutubeVideoItem(this.snippet,this.contentDetails, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => YoutubePlayVideo(contentDetails.videoId)));

      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: widthScreen * .33,
                height: widthScreen * .45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(snippet.thumbnails.high.url),
                  ) ,
                ),
              ),
              Icon(
                Icons.play_arrow,
                color: AppColors.playArrowColor,
                size: 45,
              )
            ],
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
      ),
    );
  }
}
