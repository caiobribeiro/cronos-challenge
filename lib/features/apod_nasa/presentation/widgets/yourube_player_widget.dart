import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YourubePlayerWidget extends StatefulWidget {
  final AstronomyPictureEntity video;
  const YourubePlayerWidget({super.key, required this.video});

  @override
  State<YourubePlayerWidget> createState() => _YourubePlayerWidgetState();
}

class _YourubePlayerWidgetState extends State<YourubePlayerWidget> {
  late YoutubePlayerController ytController;
  initYoutubeController({required AstronomyPictureEntity video}) {
    ytController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(video.url!)!,
      flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: true,
          disableDragSeek: true,
          loop: true,
          enableCaption: false),
    );
  }

  @override
  void initState() {
    super.initState();
    initYoutubeController(video: widget.video);
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: ytController,
      showVideoProgressIndicator: true,
    );
  }
}
