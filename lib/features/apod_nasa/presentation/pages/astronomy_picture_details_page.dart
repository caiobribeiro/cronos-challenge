import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/widgets/yourube_player_widget.dart';
import 'package:flutter/material.dart';

class AstronomyPictureDetailsPage extends StatefulWidget {
  final AstronomyPictureEntity picture;
  const AstronomyPictureDetailsPage({super.key, required this.picture});

  @override
  State<AstronomyPictureDetailsPage> createState() =>
      _AstronomyPictureDetailsPageState();
}

class _AstronomyPictureDetailsPageState
    extends State<AstronomyPictureDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.picture.title!),
      ),
      body: ListView(
        children: [
          if (widget.picture.mediaType == 'image')
            Image.network(widget.picture.url!),
          if (widget.picture.mediaType == 'video')
            YourubePlayerWidget(video: widget.picture),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.picture.explanation!,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text('Published: '),
                Text(widget.picture.date!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
