import 'package:flutter/material.dart';

class Fornecedor extends StatefulWidget {
  const Fornecedor({super.key});

  @override
  State<Fornecedor> createState() => _FornecedorState();
}

class _FornecedorState extends State<Fornecedor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("FORNECEDORES", style: TextStyle(fontSize: 25)),
      ),
    );
  }
}
