import 'package:farmacy/Telas/fornecedor.dart';
import 'package:farmacy/Telas/grupos/grupos.dart';
import 'package:farmacy/Telas/home.dart';
import 'package:farmacy/Telas/produtos.dart';
import 'package:farmacy/Telas/relatorios.dart';
import 'package:flutter/material.dart';
import 'package:farmacy/telas/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmácia',
      theme: ThemeData(
        primaryColor: Color(0xFF16697A),
        scaffoldBackgroundColor: Color(0xFFEDE7E3),
      ),
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
      // APP BAR
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            icon: Icon(
              Icons.account_circle_outlined,
              size: 30,
              color: Color(0xFF489FB5),
            ),
          ),
        ],
        title: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(50, 0, 0, 0),
            child: Text(
              "Farmácia",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xFF489FB5),
                fontSize: 27,
              ),
            ),
          ),
        ),
      ),

      body: Container(padding: EdgeInsets.all(16), child: telas[_indiceAtual]),
      backgroundColor: Color(0xFFEDE7E3),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFFFA62B),
          unselectedItemColor: Color(0xFF82C0CC),

          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),

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
