import 'dart:io';

import 'package:covid_app/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'estadoResponse.dart';

class NumerosCovid extends StatefulWidget{
  String nomeEstado;
  String siglaEstado;
  NumerosCovid({required this.siglaEstado, required this.nomeEstado});



  @override
  _NumerosCovidState createState() => _NumerosCovidState();

}

class _NumerosCovidState extends State<NumerosCovid>{


  Future<EstadoResponse> buscaDados() async {
    String sigla = this.widget.siglaEstado;
    http.Response response = await http.get(Uri.parse('http://172.17.0.1:8000/api/covid/${sigla}'));
    var dadosJson = jsonDecode(response.body);
    EstadoResponse estadoResponse = EstadoResponse.withJSON(dadosJson);



    return estadoResponse;
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(appBar:AppBar(title: Text("Dados " + this.widget.nomeEstado), backgroundColor: Colors.pink),
        body: Container(
            decoration: BoxDecoration(),
            child: Column(
                children: <Widget> [
                  Padding(
                      padding: EdgeInsets.only(bottom: 0),child:
                  FutureBuilder<EstadoResponse>(future: buscaDados(), builder: (context, state){
                    switch(state.connectionState)
                    {
                      case ConnectionState.waiting:

                        return Container(
                            child: Center(
                           child:   Padding(padding: EdgeInsets.only(top:70),

                              child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.pink),) ,
                            )
                            ));

                      case ConnectionState.done:

                        return Container(

                        child:Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Padding(padding: EdgeInsets.only(top:70),
                                    child:Text("Numero de casos :", style: AppTextStyles.titleDetalhes,)),
                                Padding(padding: EdgeInsets.only(top:70,left: 10),
                                    child:Text(state.data!.numeroCasos.toString(), style: AppTextStyles.subtitleDetalhes )),

                              ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Padding(padding: EdgeInsets.only(top:10),
                                    child:Text("Numero de mortos :", style: AppTextStyles.titleDetalhes,)),
                                Padding(padding: EdgeInsets.only(top:10,left: 10),
                                    child:Text(state.data!.numeroMortos.toString(), style: AppTextStyles.subtitleDetalhes )),

                              ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Padding(padding: EdgeInsets.only(top:10),
                                    child:Text("Vacinas 1º dose :", style: AppTextStyles.titleDetalhes,)),
                                Padding(padding: EdgeInsets.only(top:10,left: 10),
                                    child:Text(state.data!.vacinados.toString(), style: AppTextStyles.subtitleDetalhes )),

                              ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:<Widget> [
                                Padding(padding: EdgeInsets.only(top:10),
                                    child:Text("Numero de recuperados :", style: AppTextStyles.titleDetalhes,)),
                                Padding(padding: EdgeInsets.only(top:10,left: 10),
                                    child:Text(state.data!.recuperados.toString(), style: AppTextStyles.subtitleDetalhes )),

                              ],

                            ),


                          ],
                        )
                        ) ;
                    }return  Text('deu certo...');
                  }))])));
  }





}