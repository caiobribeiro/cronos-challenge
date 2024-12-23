import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:cronos_challenge/features/apod_nasa/data/models/astronomy_picture_model.dart';

void main() {
  const astronomyPictureJson = '''
  [
    {
      "copyright": "T. Rector",
      "date": "2017-07-08",
      "explanation": "Similar in size to large, bright spiral galaxies in our neighborhood, IC 342 is a mere 10 million light-years distant in the long-necked, northern constellation Camelopardalis. A sprawling island universe, IC 342 would otherwise be a prominent galaxy in our night sky, but it is hidden from clear view and only glimpsed through the veil of stars, gas and dust clouds along the plane of our own Milky Way galaxy. Even though IC 342's light is dimmed by intervening cosmic clouds, this sharp telescopic image traces the galaxy's own obscuring dust, blue star clusters, and glowing pink star forming regions along spiral arms that wind far from the galaxy's core. IC 342 may have undergone a recent burst of star formation activity and is close enough to have gravitationally influenced the evolution of the local group of galaxies and the Milky Way.",
      "hdurl": "https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Hidden Galaxy IC 342",
      "url": "https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg"
    },
    {
      "date": "2017-07-09",
      "explanation": "Can you find your favorite country or city? Surprisingly, on this world-wide nightscape, city lights make this task quite possible. Human-made lights highlight particularly developed or populated areas of the Earth's surface, including the seaboards of Europe, the eastern United States, and Japan. Many large cities are located near rivers or oceans so that they can exchange goods cheaply by boat. Particularly dark areas include the central parts of South America, Africa, Asia, and Australia. The featured composite was created from images that were collected during cloud-free periods in April and October 2012 by the Suomi-NPP satellite, from a polar orbit about 824 kilometers above the surface, using its Visible Infrared Imaging Radiometer Suite (VIIRS).",
      "hdurl": "https://apod.nasa.gov/apod/image/1707/EarthAtNight_SuomiNPP_3600.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Earth at Night",
      "url": "https://apod.nasa.gov/apod/image/1707/EarthAtNight_SuomiNPP_1080.jpg"
    },
    {
      "date": "2017-07-10",
      "explanation": "What's happening around the center of this spiral galaxy? Seen in total, NGC 1512 appears to be a barred spiral galaxy -- a type of spiral that has a straight bar of stars across its center. This bar crosses an outer ring, though, a ring not seen as it surrounds the pictured region. Featured in this Hubble Space Telescope image is an inner ring -- one that itself surrounds the nucleus of the spiral. The two rings are connected not only by a bar of bright stars but by dark lanes of dust. Inside of this inner ring, dust continues to spiral right into the very center -- possibly the location of a large black hole. The rings are bright with newly formed stars which may have been triggered by the collision of NGC 1512 with its galactic neighbor, NGC 1510.",
      "hdurl": "https://apod.nasa.gov/apod/image/1707/NGC1512_Schmidt_1342.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Spiral Galaxy NGC 1512: The Nuclear Ring",
      "url": "https://apod.nasa.gov/apod/image/1707/NGC1512_Schmidt_960.jpg"
    }
  ]
  ''';

  test('fromMap creates a valid AstronomyPictureModel object', () {
    final Map<String, dynamic> map = json.decode(astronomyPictureJson)[0];
    final model = AstronomyPictureModel.fromMap(map);

    expect(model.copyright, 'T. Rector');
    expect(model.date, '2017-07-08');
    expect(model.explanation, startsWith('Similar in size to large, bright'));
    expect(model.hdurl,
        'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg');
    expect(model.mediaType, 'image');
    expect(model.serviceVersion, 'v1');
    expect(model.title, 'Hidden Galaxy IC 342');
    expect(model.url,
        'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg');
  });

  test('toMap returns a valid map from AstronomyPictureModel object', () {
    const model = AstronomyPictureModel(
      copyright: 'T. Rector',
      date: '2017-07-08',
      explanation:
          'Similar in size to large, bright spiral galaxies in our neighborhood, IC 342 is a mere 10 million light-years distant in the long-necked, northern constellation Camelopardalis.',
      hdurl: 'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg',
      mediaType: 'image',
      serviceVersion: 'v1',
      title: 'Hidden Galaxy IC 342',
      url: 'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg',
    );

    final map = model.toMap();

    expect(map['copyright'], 'T. Rector');
    expect(map['date'], '2017-07-08');
    expect(map['explanation'], startsWith('Similar in size to large, bright'));
    expect(map['hdurl'],
        'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg');
    expect(map['mediaType'], 'image');
    expect(map['serviceVersion'], 'v1');
    expect(map['title'], 'Hidden Galaxy IC 342');
    expect(map['url'],
        'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg');
  });

  test('fromJson creates a valid AstronomyPictureModel object', () {
    final jsonString = json.encode(json.decode(astronomyPictureJson)[0]);
    final model = AstronomyPictureModel.fromJson(jsonString);

    expect(model.copyright, 'T. Rector');
    expect(model.date, '2017-07-08');
    expect(model.explanation, startsWith('Similar in size to large, bright'));
    expect(model.hdurl,
        'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg');
    expect(model.mediaType, 'image');
    expect(model.serviceVersion, 'v1');
    expect(model.title, 'Hidden Galaxy IC 342');
    expect(model.url,
        'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg');
  });

  test('toJson returns a valid JSON string from AstronomyPictureModel object',
      () {
    const model = AstronomyPictureModel(
      copyright: 'T. Rector',
      date: '2017-07-08',
      explanation:
          'Similar in size to large, bright spiral galaxies in our neighborhood, IC 342 is a mere 10 million light-years distant in the long-necked, northern constellation Camelopardalis.',
      hdurl: 'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg',
      mediaType: 'image',
      serviceVersion: 'v1',
      title: 'Hidden Galaxy IC 342',
      url: 'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg',
    );

    final jsonString = model.toJson();
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    expect(jsonMap['copyright'], 'T. Rector');
    expect(jsonMap['date'], '2017-07-08');
    expect(
        jsonMap['explanation'], startsWith('Similar in size to large, bright'));
    expect(jsonMap['hdurl'],
        'https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg');
    expect(jsonMap['mediaType'], 'image');
    expect(jsonMap['serviceVersion'], 'v1');
    expect(jsonMap['title'], 'Hidden Galaxy IC 342');
    expect(jsonMap['url'],
        'https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg');
  });
}
