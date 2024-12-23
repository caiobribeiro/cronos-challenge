import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/core/usecases/usecase.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/repository/apod_repository.dart';

class GetAstronomyPicturesUseCase
    implements UseCase<DataState<List<AstronomyPictureEntity>>, List<String>> {
  final AstronomyPicturesRepository _astronomyPicturesRepository;

  GetAstronomyPicturesUseCase(this._astronomyPicturesRepository);

  @override
  Future<DataState<List<AstronomyPictureEntity>>> call({List<String>? params}) {
    return _astronomyPicturesRepository.getAstronomyPictures(
      startDate: params!.first,
      endDate: params.last,
    );
  }
}
