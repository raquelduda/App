import 'package:farmacy/Telas/grupos/addgrupo.dart';
import 'package:farmacy/Telas/grupos/listview.dart';
import 'package:flutter/material.dart';

class Grupos extends StatefulWidget {
  const Grupos({super.key});

  @override
  State<Grupos> createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListaGrupos(),
          ListaGrupos(),
          ListaGrupos(),
          ListaGrupos(),
          ListaGrupos(),
          ListaGrupos(),
          ListaGrupos(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addgrupo()),
          );
        },

        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0F4571),
        foregroundColor: Colors.white,

        shape: CircleBorder(),
      ),
    );
  }
}
