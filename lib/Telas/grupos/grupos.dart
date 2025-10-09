import 'dart:convert';
import 'package:farmacy/Telas/grupos/addgrupo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:farmacy/Telas/grupos/listview.dart';

class Grupos extends StatefulWidget {
  const Grupos({super.key});

  @override
  State<Grupos> createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe8e8e8),

      body: Column(
        children: <Widget>[
          Container(
            child: SearchBar(
              hintText: "Pesquisar por Grupo...",
              leading: Icon(Icons.search),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final name = user['name']['first'];
                return ListTile(
                  title: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF2B4593),
                      borderRadius: BorderRadius.circular(8),

                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(66, 27, 1, 121),
                          blurRadius: 7,
                          offset: Offset(4, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Color(0xFFe8e8e8),
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Addgrupo()),
          );
        },

        shape: CircleBorder(),
        backgroundColor: Colors.yellow.shade800,
        foregroundColor: Color(0xFF2B4593),
        child: Icon(Icons.add),
      ),
    );
  }

  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=35';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}
