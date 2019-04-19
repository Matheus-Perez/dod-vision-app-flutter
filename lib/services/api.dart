import 'dart:convert';
import 'package:dio/dio.dart';

class Api {
  static final Api _instance = Api.internal();
  factory Api() => _instance;
  Api.internal();

  final Dio _dio = Dio();
  final String _url = 'https://tv.dodvision.com/test-app/';

  // Envia para a API a imagem em base64
  Future<String> sendPicture({String image}) async {
    try {
      Response response = await _dio.post(_url, data: {"image": image});

      if(response.statusCode == 200){
        // printa o retorono da API e retorna somente a final_image
        print(response.data);
        return response.data['emissora']['final_image'];
      }else{
        print('ERRO[API L19]');
        throw response.statusCode;
      }
    } catch (error) {
      print('ERRO[API L23]');
      throw error;
    }
  }
}
