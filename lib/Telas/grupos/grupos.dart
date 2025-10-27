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
  List<dynamic> allUsers = []; //lista completa da api
  TextEditingController searchController = TextEditingController();

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
              controller: searchController,
              hintText: "Pesquisar por Grupo...",
              leading: const Icon(Icons.search),
              onChanged: (value) {
                filterUsers(value);
              },
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
                  onTap: () => openDialog(),
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
          openDialog();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Addgrupo()),
          // );
        },

        shape: CircleBorder(),
        backgroundColor: Colors.yellow.shade800,
        foregroundColor: Color(0xFF2B4593),
        child: Icon(Icons.add),
      ),
    );
  }

  Future openDialog() => showDialog(
    context: context,
    builder: (BuildContext context) {
      bool isChecked = false; // variável temporária para o popup

      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text('Editar ou criar grupo'),
            content: TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                prefixIcon: Icon(Icons.medical_services),
                suffixIcon: Icon(Icons.clear),
              ),
            ),
            actions: [
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: Colors.blueAccent,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(
                        Color(0xFFe8e8e8),
                      ),
                      minimumSize: WidgetStatePropertyAll(const Size(100, 50)),
                    ),
                    child: Text('Deletar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Ativo: $isChecked");
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(
                        Color(0xFFe8e8e8),
                      ),
                      minimumSize: WidgetStatePropertyAll(const Size(100, 50)),
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
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      allUsers = json['results']; // salva todos
      users = allUsers; // exibe todos no início
    });
  }

  // Filtra resultados com base no texto digitado
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
