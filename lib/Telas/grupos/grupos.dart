import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Grupos extends StatefulWidget {
  const Grupos({super.key});

  @override
  State<Grupos> createState() => _GruposState();
}

class _GruposState extends State<Grupos> {
  bool? isChecked = false;
  List<dynamic> users = [];
  List<dynamic> allUsers = []; // lista completa da API
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDE7E3),

      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              controller: searchController,
              onChanged: filterUsers,
              decoration: InputDecoration(
                hintText: "Pesquisar por Grupo...",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Color(0xFF489FB5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: users.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                final user = users[index];
                final name = user['name']['first'];
                return GestureDetector(
                  onTap: () => openDialog(),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFF82C0CC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Color(0xFFEDE7E3),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
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
        onPressed: openDialog,
        shape: CircleBorder(),
        backgroundColor: Color(0xFFFFA62B),
        foregroundColor: Color(0xFFEDE7E3),
        child: Icon(Icons.add),
      ),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (BuildContext context) {
      bool isChecked = false;

      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text('Editar ou criar grupo'),
            content: TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                prefixIcon: Icon(
                  Icons.medical_services,
                  color: Color(0xFF16697A),
                ),
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            actions: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Color(0xFF16697A),
                    onChanged: (newBool) {
                      setStateDialog(() {
                        isChecked = newBool!;
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
                    onPressed: () => Navigator.pop(context),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color(0xFFFFA62B),
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Color(0xFFEDE7E3),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(100, 50)),
                    ),
                    child: Text('Deletar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Ativo: $isChecked");
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color(0xFF489FB5),
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Color(0xFFEDE7E3),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(100, 50)),
                    ),
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );

  // Busca os usuários da API
  void fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=5';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      allUsers = json['results']; // salva todos
      users = allUsers; // exibe todos no início
    });
  }

  // Filtro na barra de pesquisa
  void filterUsers(String query) {
    final filtered = allUsers.where((user) {
      final name = user['name']['first'].toString().toLowerCase();
      return name.contains(query.toLowerCase());
    }).toList();

    setState(() {
      users = filtered;
    });
  }
}
