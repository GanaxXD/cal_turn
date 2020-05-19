import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cargaTotal = TextEditingController();
  TextEditingController _cargaTrimming = TextEditingController();
  TextEditingController _cargaCarregada  = TextEditingController();
  TextEditingController _fluxoSistema = TextEditingController();
  String _resultHoras;

  @override
  void dispose() {
    _cargaTotal.dispose();
    _cargaTrimming.dispose();
    _cargaCarregada.dispose();
    _fluxoSistema.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Turnos"),
        backgroundColor: Colors.green[900],
        centerTitle: true,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white,),
                  onPressed: (){
                    _resultHoras = "--:--";
                    _cargaTotal.text = "";
                    _cargaTrimming.text = "";
                    _cargaCarregada.text = "";
                    _fluxoSistema.text = "";
                  }
              ),
            ],
          ),
        ],
      ),
    );
  }
}
