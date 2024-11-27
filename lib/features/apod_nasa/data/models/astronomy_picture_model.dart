import 'dart:convert';

import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';

class AstronomyPictureModel extends AstronomyPictureEntity {
  const AstronomyPictureModel({
    super.copyright,
    super.date,
    super.explanation,
    super.hdurl,
    super.mediaType,
    super.serviceVersion,
    super.title,
    super.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'copyright': copyright,
      'date': date,
      'explanation': explanation,
      'hdurl': hdurl,
      'mediaType': mediaType,
      'serviceVersion': serviceVersion,
      'title': title,
      'url': url,
    };
  }

  factory AstronomyPictureModel.fromMap(Map<String, dynamic> map) {
    return AstronomyPictureModel(
      copyright: map['copyright'],
      date: map['date'],
      explanation: map['explanation'],
      hdurl: map['hdurl'],
      mediaType: map['media_type'],
      serviceVersion: map['service_version'],
      title: map['title'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AstronomyPictureModel.fromJson(String source) =>
      AstronomyPictureModel.fromMap(json.decode(source));
}
