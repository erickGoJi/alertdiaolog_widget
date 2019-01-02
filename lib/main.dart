import 'package:flutter/material.dart';

void main (){
  runApp(
    new MaterialApp(
      home: MyDialog(),
    )
  );
}

class MyDialog extends StatefulWidget{
  @override
  _MyDialog createState() => new _MyDialog();
}

enum DialogAction{
  yes,
  no
}

class _MyDialog extends State<MyDialog>{
  String _inputValue = "";

  void _alertResult(DialogAction action){
    print("Tu selección es $action");
  }
  void _showAlert(String value){
      AlertDialog dialog = new AlertDialog(
        content: new Text(value),
        actions: <Widget>[
          new FlatButton(onPressed: () { _alertResult(DialogAction.yes); }, child: new Text("Si")),
          new FlatButton(onPressed: () { _alertResult(DialogAction.no);}, child: new Text("No"))
          
        ],
      );
      showDialog(context: context,child: dialog);
  }

  void _onChanged(String value){
    setState(() {
      _inputValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Demo Alert Dialog"),
      ),
      body: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Ingrese el texto"
                ),
                onChanged: (String value){ _onChanged(value);},
              ),
              new RaisedButton(
                child: new Text("Ver Alerta"),
                onPressed: (){_showAlert(_inputValue);},
              )
            ],
          ),
        ),
      ),
    );
  }
}