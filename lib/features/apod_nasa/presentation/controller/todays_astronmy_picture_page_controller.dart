import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/features/apod_nasa/data/data_source/astronomy_picture_api_service.dart';
import 'package:cronos_challenge/features/apod_nasa/data/repository/astronomy_picture_repository_impl.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/usecases/astronomy_picture_usecases.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/state/todays_astronmy_picture_page_state.dart';
import 'package:intl/intl.dart';

class TodaysAstronomyPicturePageController {
  final AstronomyPictureState _state = AstronomyPictureState();

  AstronomyPictureState get state => _state;

  Future<void> fetchTodayAstronomyPicture() async {
    final repository =
        AstronomyPicturesRepositoryImpl(AstronomyPictureService());
    final useCase = GetAstronomyPicturesUseCase(repository);
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    _state.setLoading(true);
    final result = await useCase.call(params: [today, today]);
    if (result is DataSuccess) {
      _state.setPictures(result.data!);
    } else if (result is DataFailed) {
      _state.setError(Exception(result.clientException));
    }
    _state.setLoading(false);
  }
}
