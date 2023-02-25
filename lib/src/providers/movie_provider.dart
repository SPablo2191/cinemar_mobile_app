import 'package:cinemar_mobile_app/src/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieProvider {
  String _url = dotenv.env['API_URL'] ?? 'API_URL not found';
  String _api_key = dotenv.env['API_KEY'] ?? '';
  String _language = dotenv.env['LANGUAGE'] ?? 'en-US';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '/movie/now_playing');
  }
}
