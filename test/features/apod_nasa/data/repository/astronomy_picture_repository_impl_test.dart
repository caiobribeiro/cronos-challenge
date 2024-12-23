import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/features/apod_nasa/data/data_source/astronomy_picture_api_service.dart';
import 'package:cronos_challenge/features/apod_nasa/data/repository/astronomy_picture_repository_impl.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAstronomyPictureService extends Mock
    implements AstronomyPictureService {}

void main() {
  late AstronomyPicturesRepositoryImpl repository;
  late MockAstronomyPictureService mockService;

  setUp(() {
    mockService = MockAstronomyPictureService();
    repository = AstronomyPicturesRepositoryImpl(mockService);
  });

  const startDate = '2023-01-01';
  const endDate = '2023-01-31';

  final astronomyPictureJson = [
    {
      "copyright": "T. Rector",
      "date": "2017-07-08",
      "explanation":
          "Similar in size to large, bright spiral galaxies in our neighborhood, IC 342 is a mere 10 million light-years distant in the long-necked, northern constellation Camelopardalis. A sprawling island universe, IC 342 would otherwise be a prominent galaxy in our night sky, but it is hidden from clear view and only glimpsed through the veil of stars, gas and dust clouds along the plane of our own Milky Way galaxy. Even though IC 342's light is dimmed by intervening cosmic clouds, this sharp telescopic image traces the galaxy's own obscuring dust, blue star clusters, and glowing pink star forming regions along spiral arms that wind far from the galaxy's core. IC 342 may have undergone a recent burst of star formation activity and is close enough to have gravitationally influenced the evolution of the local group of galaxies and the Milky Way.",
      "hdurl": "https://apod.nasa.gov/apod/image/1707/ic342_rector2048.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Hidden Galaxy IC 342",
      "url": "https://apod.nasa.gov/apod/image/1707/ic342_rector1024s.jpg"
    },
    {
      "date": "2017-07-09",
      "explanation":
          "Can you find your favorite country or city?  Surprisingly, on this world-wide nightscape, city lights make this task quite possible.  Human-made lights highlight particularly developed or populated areas of the Earth's surface, including the seaboards of Europe, the eastern United States, and Japan.  Many large cities are located near rivers or oceans so that they can exchange goods cheaply by boat.  Particularly dark areas include the central parts of South America, Africa, Asia, and Australia.  The featured composite was created from images that were collected during cloud-free periods in April and October 2012 by the Suomi-NPP satellite, from a polar orbit about 824 kilometers above the surface, using its Visible Infrared Imaging Radiometer Suite (VIIRS).",
      "hdurl":
          "https://apod.nasa.gov/apod/image/1707/EarthAtNight_SuomiNPP_3600.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Earth at Night",
      "url":
          "https://apod.nasa.gov/apod/image/1707/EarthAtNight_SuomiNPP_1080.jpg"
    },
    {
      "date": "2017-07-10",
      "explanation":
          "What's happening around the center of this spiral galaxy? Seen in total, NGC 1512 appears to be a barred spiral galaxy -- a type of spiral that has a straight bar of stars across its center.  This bar crosses an outer ring, though, a ring not seen as it surrounds the pictured region. Featured in this Hubble Space Telescope image is an inner ring -- one that itself surrounds the nucleus of the spiral.  The two rings are connected not only by a bar of bright stars but by dark lanes of dust. Inside of this inner ring, dust continues to spiral right into the very center -- possibly the location of a large black hole. The rings are bright with newly formed stars which may have been triggered by the collision of NGC 1512 with its galactic neighbor, NGC 1510.",
      "hdurl": "https://apod.nasa.gov/apod/image/1707/NGC1512_Schmidt_1342.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "Spiral Galaxy NGC 1512: The Nuclear Ring",
      "url": "https://apod.nasa.gov/apod/image/1707/NGC1512_Schmidt_960.jpg"
    }
  ];

  group('AstronomyPicturesRepositoryImpl', () {
    test('should return DataSuccess when the HTTP response is 200', () async {
      when(() => mockService.getAstronomyPicturesFromDateRange(
                startDate: any(named: 'startDate'),
                endDate: any(named: 'endDate'),
              ))
          .thenAnswer((_) async => http.Response(
              json.encode(astronomyPictureJson), 200,
              reasonPhrase: 'OK'));

      final result = await repository.getAstronomyPictures(
          startDate: startDate, endDate: endDate);

      expect(result, isA<DataSuccess<List<AstronomyPictureEntity>>>());
      expect((result as DataSuccess).data, isA<List<AstronomyPictureEntity>>());
    });

    test('should return DataFailed when the HTTP response is not 200',
        () async {
      when(() => mockService.getAstronomyPicturesFromDateRange(
                startDate: any(named: 'startDate'),
                endDate: any(named: 'endDate'),
              ))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      final result = await repository.getAstronomyPictures(
          startDate: startDate, endDate: endDate);

      expect(result, isA<DataFailed>());
    });
  });
}
