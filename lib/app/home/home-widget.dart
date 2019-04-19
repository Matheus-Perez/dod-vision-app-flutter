import 'package:flutter/material.dart';
import 'package:vagas_dod/app/home/home-bloc.dart';
import 'package:vagas_dod/widgets/button-default-widget.dart';
import 'package:vagas_dod/widgets/subtitle-default-widget.dart';
import 'package:vagas_dod/widgets/useful-widget.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UsefulWidget.primaryColor,
      appBar: AppBar(
        title: Text("App de teste"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SubTitleDefault(
                    texto: 'Para enviar a foto basta clicar no botão'),

                // Loading do botão
                StreamBuilder<bool>(
                    stream: bloc?.buttonLoadingFlux,
                    initialData: false,
                    builder: (context, snapshot) {
                      return ButtonDefault(
                          texto: 'Tirar Foto',
                          loading: snapshot.data,
                          onTap: () => bloc?.catchpicture());
                    }),

                SizedBox(height: 10),

                // Apresenta a imagem
                StreamBuilder<String>(
                    stream: bloc?.txtImageFlux,
                    builder: (context, snapshot) {
                      Widget widgetSelecionado;
                      
                      if (snapshot.data != null) {
                        widgetSelecionado = FadeInImage.assetNetwork(
                          height: 300,
                          image: snapshot.data,
                          placeholder: 'assets/gif/loading.gif',
                        );
                      } else {
                        widgetSelecionado = Container();
                      }
                      return widgetSelecionado;
                    }),

                // mensagem de erro
                StreamBuilder<String>(
                    stream: bloc?.txtErroFlux,
                    initialData: null,
                    builder: (context, snapshot) {
                      String texto =
                          (snapshot.data != null) ? snapshot.data : '';

                      return SubTitleDefault(
                        texto: texto,
                        fontColor: Colors.red,
                      );
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
