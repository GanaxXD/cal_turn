import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  var horaTotal, minutoTotal, horaAtual, minutoAtual;
  ResultScreen(this.horaTotal, this.minutoTotal, this.horaAtual, this.minutoAtual);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            Text("RESULTADO: \n\nPara a hora ${horaAtual.toString()} : ${minutoAtual.toString()}, "
                "a próxima carga será às ${horaTotal.toString()} : ${minutoTotal.toString().substring(0,2)}.", style: TextStyle(
                color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 18
            ), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
