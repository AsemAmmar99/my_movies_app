import 'package:dio/dio.dart';
import 'package:my_movies_app/constants/constants_methods.dart';
import 'package:my_movies_app/constants/end_points.dart';
import 'package:my_movies_app/data/remote/data_providers/my_dio.dart';

import '../../responses/persons/persons_response.dart';

class PersonsRequest{
  Future personsRequest({
  required String apiKey,
}) async{
    try {
      Response response = await MyDio.getData(
        endPoint: popularPersons,
        query: {
        'api_key': apiKey,
      },
      );
      printTest('personsRequestStatusCode ${response.statusCode}');
      printResponse(response.data.toString());
      return PersonsResponse.fromJson(response.data);
    } catch(error){
      printError('personsRequest $error');
    }
  }
}