import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vagas_dod/services/api.dart';

class HomeBloc {
  final Api api = Api();

  final buttonLoadingController = BehaviorSubject<bool>.seeded(false);
  Observable<bool> get buttonLoadingFlux =>
      buttonLoadingController?.stream?.distinct();
  Sink<bool> get buttonLoadingEvent => buttonLoadingController?.sink;

  // Stream para quando a API retornar
  final txtImageController = BehaviorSubject<String>.seeded(null);
  Observable<String> get txtImageFlux => txtImageController?.stream?.distinct();
  Sink<String> get txtImageEvent => txtImageController?.sink;

  // Stream para retorno de erro para o usuario
  final txtErroControler = BehaviorSubject<String>.seeded(null);
  Observable<String> get txtErroFlux => txtErroControler?.stream?.distinct();
  Sink<String> get txtErroEvent => txtErroControler?.sink;

  // Captura a foto do celular usando a camera, e envia para api
  void catchpicture() async {
    this.txtImageEvent.add(null);
    this.txtErroEvent.add(null);

    try {
      // Ativa o loading do botão
      this?.buttonLoadingEvent?.add(true);
      // Pega a imagem
      var image = await ImagePicker.pickImage(source: ImageSource.camera);

      // Quando for null tem que executar uma tratativa diferente
      if (image != null) {
        // Converte ela em base64
        String base64Image = base64Encode(image.readAsBytesSync());
        String final_image = await api.sendPicture(image: base64Image);
        // Apresenta ela para o usuario
        this.txtImageEvent.add('https://tv.dodvision.com/${final_image}');
      }
      // remove o loading do botão
      this?.buttonLoadingEvent?.add(false);
    } catch (error) {
      print(error);
      // remove o loading
      this?.buttonLoadingEvent?.add(false);
      // Pega o tipo do erro para apresetar
      String mensagem;
      if(error is PlatformException){
        PlatformException erro = error;
        mensagem = erro.message;
      }else if(error is String){
         mensagem = error;
      }else{
         mensagem = 'Houston, temos um problema';
      }

      // Retorna o erro para o usuario
      this.txtErroEvent.add(mensagem);
    }
  }

  @override
  void dispose() {
    buttonLoadingController?.close();
    txtImageController?.close();
    txtErroControler?.close();
  }
}
