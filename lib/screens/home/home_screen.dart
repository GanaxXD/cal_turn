import 'package:calcfilipi_app/screens/home/result_screen.dart';
import 'package:calcfilipi_app/widgets/circular_button.dart';
import 'package:calcfilipi_app/widgets/form_field.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _cargaTotal = TextEditingController();
  TextEditingController _cargaTrimming = TextEditingController();
  TextEditingController _cargaCarregada  = TextEditingController();
  TextEditingController _fluxoSistema = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String _resultHoras;
  double result, total, trimming, carregado, fluxo, resultHoras;

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
        backgroundColor: Colors.green[800],
        centerTitle: false,
        actions: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.exit_to_app, color: Colors.white,),
                  onPressed: (){
                    exit(0);
                  }
              ),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form_FieldNumber(
                label: "Carga Total (ex: 230000)",
                hint: "Digite um valor",
                helper: "Informe a carga total",
                controller: _cargaTotal,
                //ignore: missing_return
                onValidade: (value){
                  double x = double.tryParse(value);
                  if(x == 0 || x == null || x <0 ) return "Valor inválido";
                },
                onSave: (value){
                  total = double.tryParse(value);
                },
              ),

              Form_FieldNumber(
                label: "Carga de Trimming (ex: 120000)",
                hint: "Digite um valor",
                helper: "Informe a carga de trimming",
                controller: _cargaTrimming,
                //ignore: missing_return
                onValidade: (value){
                  double x = double.tryParse(value);
                  if(x == 0 || x == null || x <0) return "Valor inválido";
                },
                onSave: (value){
                  trimming = double.tryParse(value);
                },
              ),

              Form_FieldNumber(
                label: "Total Carregado (ex: 10000)",
                hint: "Digite um valor",
                helper: "Informe o total carregado",
                controller: _cargaCarregada,
                //ignore: missing_return
                onValidade: (value){
                  double x = double.tryParse(value);
                  if(x == 0 || x == null || x <0) return "Valor inválido";
                },
                onSave: (value){
                  carregado = double.tryParse(value);
                },
              ),

              Form_FieldNumber(
                label: "Fluxo do Sistema (ex: 100000)",
                hint: "Digite um valor",
                helper: "Informe o fluxo do sistema",
                controller: _fluxoSistema,
                //ignore: missing_return
                onValidade: (value){
                  double x = double.tryParse(value);
                  if(x == 0 || x == null || x <0) return "Valor inválido";
                },
                onSave: (value){
                  fluxo = double.tryParse(value);
                },
              ),

              SizedBox(height: 30,),

              Divider(color: Colors.green, height: 5,),

              SizedBox(height: 30,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: CircularButton(
                      text: "Calcular",
                      apertar: (){
                        if(_key.currentState.validate()){
                          _key.currentState.save();
                          print(total.toString());
                          print(trimming.toString());
                          print(carregado.toString());
                          print(fluxo.toString());
                          var horaAtual = DateTime.now();
                          print("HORA: "+ horaAtual.hour.toString());
                          print("MINUTOS: "+horaAtual.minute.toString());

                          //Calculo da Hora:
                          resultHoras = (total - trimming - carregado) / fluxo;
                          print("resultHoras: "+resultHoras.toString());
                          //Separando a parte inteira da hora
                          var resutHorasHora = resultHoras.truncate();
                          print("resultHorasHora: "+resutHorasHora.toString());
                          //separando os minutos da hora
                          var resultHorasMinuto = (((resultHoras - resutHorasHora) * 100)*0.60);
                          print ("resultHorasMinuto: " + resultHorasMinuto.toString());

                          //total
                          var horaTotal, minutoTotal, x, y=0, z=0.0;

                          if(horaAtual.minute + resultHorasMinuto > 60){
                            x = ((horaAtual.minute + resultHorasMinuto)/60);
                            print("X: "+ x.toString());
                            y = x.truncate();
                            print("Y: "+ y.toString());
                            z = ((x - y)*100)*0.60;
                            print ("Z: "+ z.toString());
                            minutoTotal = z;
                          } else {
                            minutoTotal = horaAtual.minute + resultHorasMinuto;
                          }

                          if(horaAtual.hour + resutHorasHora + y > 24){
                            horaTotal = (horaAtual.hour + resutHorasHora + y) - 24;
                            print("HORA TOTAL: "+horaTotal.toString());
                          } else {
                            horaTotal = (horaAtual.hour + resutHorasHora + y);
                            print("HORA TOTAL: "+horaTotal.toString());
                          }

                          print("HORA TOTAL: "+ horaTotal.toString());
                          print("MINUTOS TOTAL: "+ minutoTotal.toString());

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultScreen(total, trimming,
                                  carregado, resultHoras,
                                  "${horaTotal.toString()} horas e ${minutoTotal.toString()} minutos para a próxima carga.")
                          ));
                        }
                      },
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  String validaNumber(String value){
    int x = int.tryParse(value);
    if(x == 0 || x == null) return "Valor inválido";
  }
}
