import 'package:flutter/material.dart';

class Addgrupo extends StatefulWidget {
  const Addgrupo({super.key});

  @override
  State<Addgrupo> createState() => _AddgrupoState();
}

class _AddgrupoState extends State<Addgrupo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF0F4571),
        title: Align(
          alignment: AlignmentGeometry.center,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              "ADICIONAR GRUPOS",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
