import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Sejam bem-vindos!";
  int _fullCapacity = 10;

  void _changePeople(int cont) {
    setState(() {
      _people += cont;

      if (_people == 0) {
        _infoText = "Sejam bem-vindos!";
      } else if (_people < _fullCapacity) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Restaurante lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Image.asset(
        "images/restaurante.jpg",
        fit: BoxFit.cover,
        height: 1000,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Pessoas: $_people",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {
                      if (_people > 0) {
                        _changePeople(-1);
                      }
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    onPressed: () {
                      if (_people < _fullCapacity) {
                        _changePeople(1);
                      }
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    )),
              ),
            ],
          ),
          Text(
            _infoText,
            style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 30.0),
          )
        ],
      ),
    ]);
  }
}
