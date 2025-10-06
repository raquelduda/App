import 'package:flutter/material.dart';

class Relatorios extends StatefulWidget {
  const Relatorios({super.key});

  @override
  State<Relatorios> createState() => _RelatoriosState();
}

class _RelatoriosState extends State<Relatorios> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("RELATÓRIOS", style: TextStyle(fontSize: 25))),
    );
  }
}
