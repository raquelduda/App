import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("PRODUTOS", style: TextStyle(fontSize: 25))),
    );
  }
}
