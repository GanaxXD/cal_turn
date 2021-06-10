import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  double total, trimming, carregado, hora;
  String result;
  ResultScreen(this.total, this.trimming, this.carregado, this.hora, this.result);

  @override
  Widget build(BuildContext context) {

    double resultadoFinal = total-trimming-carregado;

    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
        centerTitle: true,
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text("RESULTADO: ${result}", style: TextStyle(
            color: Colors.black45, fontWeight: FontWeight.w600, fontSize: 18
        ),),
      ),
    );
  }
}
