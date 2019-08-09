import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculadora IMC",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  String _infoText = "Infome seus dados!";

  void _resetFields() {
    heightController.text = "";
    weightController.text = "";

    setState(() {
      _infoText = "Infome seus dados!";
    });
  }

  void _calculate() {
    setState(() {
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);

      double imc = weight / (height * height);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso ${imc.toStringAsPrecision(4)}";
      } else if (imc < 24.9) {
        _infoText = "Peso Ideal ${imc.toStringAsPrecision(4)}";
      } else if (imc < 29.9) {
        _infoText = "Levemente acima do peso ${imc.toStringAsPrecision(4)}";
      } else if (imc < 34.9) {
        _infoText = "Obesidade Grau I ${imc.toStringAsPrecision(4)}";
      } else if (imc < 39.9) {
        _infoText = "Obesidade Grau II ${imc.toStringAsPrecision(4)}";
      } else {
        _infoText = "Obesidade Grau III ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120.0,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color: Colors.green),
                ),
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                textAlign: TextAlign.center,
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                style: TextStyle(color: Colors.green, fontSize: 25.0),
                textAlign: TextAlign.center,
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: _calculate,
                      child: Text(
                        "Calcular",
                        style: TextStyle(fontSize: 25.0, color: Colors.white),
                      ),
                      color: Colors.green,
                    )),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25.0),
              )
            ],
          ),
        ));
  }
}
