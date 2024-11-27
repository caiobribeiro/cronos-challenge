import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';

abstract class AstronomyPictureRepository {
  Future<DataState<AstronomyPictureEntity>> getAstronomyPicture(
      {required String todayDate});
}

abstract class AstronomyPicturesRepository {
  Future<DataState<List<AstronomyPictureEntity>>> getAstronomyPictures({
    required String startDate,
    required String endDate,
  });
}
