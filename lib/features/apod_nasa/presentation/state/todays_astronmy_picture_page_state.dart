import 'package:cronos_challenge/features/apod_nasa/domain/entities/astronomy_picture_entity.dart';
import 'package:flutter/material.dart';

class AstronomyPictureState extends ChangeNotifier {
  List<AstronomyPictureEntity>? _pictures;
  Exception? _error;
  bool _isLoading = false;

  List<AstronomyPictureEntity>? get pictures => _pictures;
  Exception? get error => _error;
  bool get isLoading => _isLoading;

  void setPictures(List<AstronomyPictureEntity> pictures) {
    _pictures = pictures;
    notifyListeners();
  }

  void setError(Exception? error) {
    _error = error;
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }
}
