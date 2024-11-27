import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:cronos_challenge/features/apod_nasa/data/data_source/astronomy_picture_api_service.dart';

void main() {
  late AstronomyPictureService service;

  setUp(() {
    service = AstronomyPictureService();
  });

  test('should return http.Response when the HTTP call completes successfully',
      () async {
    const startDate = '2023-01-01';
    const endDate = '2023-01-31';

    final result = await service.getAstronomyPicturesFromDateRange(
        startDate: startDate, endDate: endDate);

    expect(result.statusCode, 200);
    expect(result.body, isA<String>());
  });

  test('should throw an exception when the HTTP call completes with an error',
      () async {
    const startDate = '2023-01-01';
    const endDate = '2022-01-31';

    final result = await service.getAstronomyPicturesFromDateRange(
        startDate: startDate, endDate: endDate);
    log(result.body);
    expect(result.statusCode, 400);
    expect(result.body, isA<String>());
  });
}
