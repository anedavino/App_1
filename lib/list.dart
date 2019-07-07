import 'dart:convert';

import 'package:app_1/person.dart';
import 'package:flutter/material.dart';
import 'package:app_1/detail.dart';
import 'package:app_1/personDAO.dart';

class ListPage extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListPage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pessoas Cadastradas"),
         
      ),
   
      body: FutureBuilder(
        future: PersonDAO().get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data.length > 0) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(snapshot.data[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    PersonDAO()
                        .delete(snapshot.data[index].id)
                        .whenComplete(() {
                      setState(() {
                        snapshot.data.removeAt(index);
                      });
                    });
                  },
                  background: Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailPage(person: snapshot.data[index]),
                        ),
                      );
                    },
                    
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(snapshot.data[index].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(snapshot.data[index].idade + 'anos'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(snapshot.data[index].email +'@gmail.com'),
                        ),
                        
                      ],
                      
                       
                    ),

                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("Não existe nenhuma pessoa cadastrada no momento." + "Para Cadastrar clique no botão abaixo!")
            );
          };
          
        },
      ),
  
    

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(),
            ),
          );
        },
      ),
    );
}
}