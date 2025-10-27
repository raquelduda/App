// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Addgrupo extends StatefulWidget {
  const Addgrupo({super.key});

  @override
  State<Addgrupo> createState() => _AddgrupoState();
}

class _AddgrupoState extends State<Addgrupo> {
  bool? isChecked = false;
  // final String _urlBase = 'https://randomuser.me/api/?results=4';

  // _post() async {
  //   var corpo = json.encode({"userId": 1, "id": null, "title": "", "body": ""});

  //   await http.post(
  //     Uri.parse("$_urlBase/posts"),
  //     headers: {'Content-Type': 'application/json'},
  //     body: corpo,
  //   );
  // }

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
              "GRUPOS",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Color(0xFFe8e8e8),
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                prefixIcon: Icon(Icons.medical_services),
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.blueAccent,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                Text('Ativo', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    foregroundColor: WidgetStatePropertyAll(Color(0xFFe8e8e8)),
                    minimumSize: WidgetStatePropertyAll(const Size(180, 50)),
                  ),
                  child: Text('Salvar'),
                ),

                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.red),
                    foregroundColor: WidgetStatePropertyAll(Color(0xFFe8e8e8)),
                    minimumSize: WidgetStatePropertyAll(const Size(180, 50)),
                  ),
                  child: Text('Deletar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
