import 'package:dio/dio.dart';
import 'package:marvelcomics/utils/constants.dart';

//Utulity: receive data from web and pass it to the repositry

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getALLCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
