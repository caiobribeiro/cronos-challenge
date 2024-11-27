import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/pages/astronomy_picture_details_page.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/widgets/yourube_player_widget.dart';
import 'package:flutter/material.dart';

class CardPictureWidget extends StatefulWidget {
  final AstronomyPictureEntity picture;
  const CardPictureWidget({super.key, required this.picture});

  @override
  State<CardPictureWidget> createState() => _CardPictureWidgetState();
}

class _CardPictureWidgetState extends State<CardPictureWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.picture.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (widget.picture.mediaType == 'video')
            YourubePlayerWidget(
              video: widget.picture,
            ),
          if (widget.picture.mediaType == 'image')
            Image.network(widget.picture.url!),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.picture.explanation!,
              maxLines: 5,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AstronomyPictureDetailsPage(
                    picture: widget.picture,
                  ),
                ),
              );
            },
            child: const Text('Details'),
          ),
        ],
      ),
    );
  }
}
