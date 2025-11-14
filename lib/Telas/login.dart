import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Login()));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        // APP BAR
        title: Text(
          "Bem vindo de volta!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 28,
          ),
        ),

        // BOTÃO PARA RETORNO
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          iconSize: 30,
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        ),
      ),

      // BODY
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/capalogin.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.all(10)),

          //  CAMPO DE LOGIN
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Padding(padding: EdgeInsets.all(120)),

                  Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF16697A),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // CAIXAS DE EMAIL E SENHA
                  // EMAIL
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        hintText: "Email",
                      ),
                    ),
                  ),

                  //SENHA
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey.shade400),
                        hintText: "Senha",
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: null,

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color(0xFF16697A),
                      ),
                      foregroundColor: WidgetStateProperty.all(
                        Color(0xFFEDE7E3),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(100, 50)),
                    ),

                    child: Text('Entrar'),
                  ),
                  BottomAppBar(
                    color: Colors.transparent,
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
