import 'dart:convert';

import 'package:cinemar_mobile_app/src/models/movie_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class MovieProvider {
  final String _url = dotenv.env['API_URL'] ?? 'API_URL not found';
  final String _apiKey = dotenv.env['API_KEY'] ?? '';
  final String _language = dotenv.env['LANGUAGE'] ?? 'en-US';

  Future<List<Movie>> getNowPlaying() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language});
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final movies = new Movies.fromJsonList(decodedData);
    
    return movies.items;
  }
}
