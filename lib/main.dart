import 'package:farmacy/Telas/fornecedor.dart';
import 'package:farmacy/Telas/grupos/grupos.dart';
import 'package:farmacy/Telas/home.dart';
import 'package:farmacy/Telas/produtos.dart';
import 'package:farmacy/Telas/relatorios.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      // COMEÇO DO APP BAR
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF8E6),
        title: Align(
          alignment: AlignmentGeometry.center,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              "FARMÁCIA",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFF8CA6EF),
                fontSize: 35,
              ),
            ),
          ),
        ),
      ),

      body: Container(padding: EdgeInsets.all(16), child: telas[_indiceAtual]),
      backgroundColor: Color(0xFFFAF8E6),
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
          backgroundColor: Color(0xFF576390),
          selectedItemColor: Color(0xffEFBE63),
          unselectedItemColor: Color(0xFFFAF8E6),

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
