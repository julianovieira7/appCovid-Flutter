import 'package:covid_app/numeros_covid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config/app_text_styles.dart';
import 'estado.dart';

class HomeCovid extends StatefulWidget{


  @override
  _HomeCovidState createState() => _HomeCovidState();



}


class _HomeCovidState extends State<HomeCovid>{
  bool selected =  false;


  String dropDownStringItem = '';
  List<Estado> listaEstados = [Estado('ACRE', 'AC'),Estado('ALAGOAS', 'AL'),Estado('AMAPÁ', 'AP'),Estado('AMAZONAS', 'AM'), Estado('BAHIA', 'BA'),Estado('CEARÁ', 'CE'), Estado('DISTRITO FEDERAL', 'DF')
   , Estado('ESPÍRITO SANTO', 'ES'),Estado('GOIÁS', 'GO'),Estado('MARANHÃO', 'MA'),Estado('MATO GROSSO', 'MT'),Estado('MATO GROSSO DO SUL', 'MS'),
    Estado('MINAS GEAIS', 'MG'),Estado('PARÁ', 'PA'),Estado('PARAÍBA', 'PA'),Estado('PARANÁ', 'PR'),Estado('PERNAMBUCO', 'PE'), Estado('PIAUÍ', 'PI'),
    Estado('RIO DE JANEIRO', 'RJ'),Estado('RIO GRANDE DO SUL', 'RS'),Estado('RONDÔNIAL', 'RO'), Estado('RORAIMA', 'RR'), Estado('SANTA CATARINA', 'SC'),
    Estado('SÃO PAULO', 'SP'), Estado('SERGIPE', 'SE'),
    Estado('TOCANTINS', 'TO')];
  late Estado _itemSelecionado ;
  String estadoNome='';
  @override
  Widget build(BuildContext context) {
    var dropDown = DropdownButton<Estado>(
      icon: RotatedBox(
          quarterTurns: 1,
          child:Padding(padding: EdgeInsets.only(top: 30),
              child:Icon(Icons.chevron_right, color: Colors.black26))
      ),
      items : listaEstados.map((Estado dropDownStringItem) {
        return DropdownMenuItem<Estado>(
            value: dropDownStringItem,
            child:Container(
                width:280,
                child: Padding(padding: EdgeInsets.only(left: 5),
                    child:Text(dropDownStringItem.nome,))
            ));}).toList(),
      hint: Text('Selecione..', style: AppTextStyles.titleDetalhes ),
      onChanged: ( Estado? novoItemSelecionado) {
        _dropDownItemSelected(novoItemSelecionado!);
        setState(() {
          this._itemSelecionado =  novoItemSelecionado;
                  });
      },
      value: selected ? _itemSelecionado : null,
    );

    return Scaffold(appBar:
    AppBar(title: Text('Central do Covid'),backgroundColor: Colors.pink) ,

        body:SingleChildScrollView(
            child:Container(
                child:Column(

                  children: [
                Padding(padding: EdgeInsets.only(top: 140)),
                    dropDown,
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(children: <Widget> [

                      ElevatedButton(
                          onPressed: (){
                            if(_itemSelecionado != ''){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NumerosCovid(siglaEstado: _itemSelecionado.sigla,nomeEstado:
                              _itemSelecionado.nome  ,)));
                            }
                          },
                          child: Text("Avançar"),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.pink),
                            padding:MaterialStateProperty.all( EdgeInsets.symmetric(horizontal: 60)),
                          )),
                      Padding(padding: EdgeInsets.only(top: 42),)
                    ],
                      mainAxisAlignment: MainAxisAlignment.center, ),
                  ],
                )
            )
        )
    );
  }
  void _dropDownItemSelected(Estado novoItem){
    setState(() {
      this._itemSelecionado = novoItem;
      this.selected = true ;

    });
  }
}


