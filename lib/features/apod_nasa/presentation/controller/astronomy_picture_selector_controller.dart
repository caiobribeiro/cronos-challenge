import 'package:cronos_challenge/core/resources/data_state.dart';
import 'package:cronos_challenge/features/apod_nasa/data/data_source/astronomy_picture_api_service.dart';
import 'package:cronos_challenge/features/apod_nasa/data/repository/astronomy_picture_repository_impl.dart';
import 'package:cronos_challenge/features/apod_nasa/domain/usecases/astronomy_picture_usecases.dart';
import 'package:cronos_challenge/features/apod_nasa/presentation/state/astronomy_picture_selector_state.dart';
import 'package:intl/intl.dart';

class AstronomyPictureSelectorController {
  final AstronomyPictureSelectorState _state = AstronomyPictureSelectorState();

  AstronomyPictureSelectorState get state => _state;

  Future<void> fetchFromrangeAstronomyPictures({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final repository =
        AstronomyPicturesRepositoryImpl(AstronomyPictureService());
    final useCase = GetAstronomyPicturesUseCase(repository);
    final formattedStartDate = DateFormat('yyyy-MM-dd').format(startDate);
    final formattedEndDate = DateFormat('yyyy-MM-dd').format(endDate);
    _state.setLoading(true);
    final result =
        await useCase.call(params: [formattedStartDate, formattedEndDate]);
    if (result is DataSuccess) {
      _state.setPictures(result.data!);
    } else if (result is DataFailed) {
      _state.setError(Exception(result.clientException));
    }
    _state.setLoading(false);
  }
}
