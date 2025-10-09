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
        iconTheme: IconThemeData(color: Color(0xFFe8e8e8)),
        backgroundColor: Color(0xFF2B4593),
        title: Align(
          alignment: AlignmentGeometry.center,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              "ADICIONAR GRUPOS",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFe8e8e8),
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
