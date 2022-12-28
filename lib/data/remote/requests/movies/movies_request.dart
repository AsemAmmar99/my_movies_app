import 'package:dio/dio.dart';
import 'package:my_movies_app/constants/constants_methods.dart';
import 'package:my_movies_app/constants/end_points.dart';
import 'package:my_movies_app/data/remote/data_providers/my_dio.dart';

import '../../responses/movies/movies_response.dart';

class MoviesRequest{
  Future moviesRequest({
  required String apiKey,
}) async{
    try {
      Response response = await MyDio.getData(
        endPoint: popularMovies,
        query: {
        'api_key': apiKey,
      },
      );
      printTest('moviesRequestStatusCode ${response.statusCode}');
      printResponse(response.data.toString());
      return MoviesResponse.fromJson(response.data);
    } catch(error){
      printError('moviesRequest $error');
    }
  }
}