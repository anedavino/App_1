import 'package:flutter/material.dart';
import 'package:app_1/person.dart';
import 'package:app_1/personDAO.dart';

class DetailPage extends StatefulWidget {
  Person person;

  DetailPage({this.person});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController(text: widget.person?.name);
    final _controller2 = TextEditingController(text: widget.person?.idade);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Pessoas"),
      ),
      body: Column(
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
             decoration: InputDecoration(
               labelText: "Nome",
              
             ),
             controller: _controller,
  
            ),
            
          ),

        Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
             decoration: InputDecoration(
               labelText: "Idade",
              
             ),
             controller: _controller2,
            ),
            
          ),

        RaisedButton(
            onPressed: () {
              if(widget.person == null){
                widget.person = Person(name: _controller.text, idade: _controller2.text);
              }
             else{
                widget.person.name = _controller.text;
                widget.person.idade = _controller2.text;
              }
              PersonDAO().insert(person: widget.person);
              
              Navigator.pop(context); 
            },
            child: Text("Salvar"),
          )
        ],
      ),
    );
  }
}