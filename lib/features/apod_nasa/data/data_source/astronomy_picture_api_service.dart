import 'package:cronos_challenge/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class AstronomyPictureService {
  Future<http.Response> getAstronomyPicturesFromDateRange(
      {required String startDate, required String endDate}) async {
    final uri = Uri.parse(
        '$baseApiUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate');
    final response = await http.get(uri);
    return response;
  }
}
