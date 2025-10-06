import 'package:farmacy/Telas/fornecedor.dart';
import 'package:farmacy/Telas/grupos/grupos.dart';
import 'package:farmacy/Telas/home.dart';
import 'package:farmacy/Telas/produtos.dart';
import 'package:farmacy/Telas/relat%C3%B3rios.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmácia',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Grupos(),
      Produtos(),
      Home(),
      Fornecedor(),
      Relatorios(),
    ];

    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: null,
      //   backgroundColor: Color(0xFF0F4571),
      //   shape: CircleBorder(),
      //   child: Icon(Icons.home, color: Colors.white),
      //),

      // COMEÇO DO APP BAR
      appBar: AppBar(
        backgroundColor: Color(0xFF0F4571),
        title: Align(
          alignment: AlignmentGeometry.center,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              "FARMÁCIA",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 32,
              ),
            ),
          ),
        ),
      ),

      body: Container(padding: EdgeInsets.all(16), child: telas[_indiceAtual]),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),

        child: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },

          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF0F4571),
          selectedItemColor: Colors.yellow.shade800,
          unselectedItemColor: Colors.white,

          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services, size: 35),
              label: "Grupos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_sharp, size: 35),
              label: "Produtos",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 40),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 35),
              label: "Fornecedor",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report, size: 35),
              label: "Relatórios",
            ),
          ],
        ),
      ),
    );
  }
}
