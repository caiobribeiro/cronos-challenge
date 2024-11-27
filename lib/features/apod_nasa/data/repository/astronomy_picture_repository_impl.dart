import 'dart:convert';

import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/features/apod_nasa/data/data_source/astronomy_picture_api_service.dart';
import 'package:cronos_challenge/features/apod_nasa/data/models/astronomy_picture_model.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/repository/apod_repository.dart';

class AstronomyPicturesRepositoryImpl extends AstronomyPicturesRepository {
  final AstronomyPictureService _astronomyPictureService;

  AstronomyPicturesRepositoryImpl(this._astronomyPictureService);

  @override
  Future<DataState<List<AstronomyPictureEntity>>> getAstronomyPictures({
    required String startDate,
    required String endDate,
  }) async {
    final httpResponse =
        await _astronomyPictureService.getAstronomyPicturesFromDateRange(
            startDate: startDate, endDate: endDate);
    if (httpResponse.statusCode == 200) {
      List<dynamic> jsonList = json.decode(httpResponse.body);
      List<AstronomyPictureModel> astronomyPictures = jsonList
          .map((picture) => AstronomyPictureModel.fromMap(picture))
          .toList();
      return DataSuccess(astronomyPictures);
    } else {
      return DataFailed(httpResponse);
    }
  }
}
