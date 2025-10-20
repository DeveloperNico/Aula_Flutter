import 'package:flutter/material.dart';
import 'TelaApi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  // Variável correta
  String correctUser = "Nico";
  String correctPass = "123";

  // Variável que verifica se tem erros
  String message = "";

  void login() {
    if (user.text == correctUser && password.text == correctPass) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaApi()),
      );

      setState(() {
        message = "";
      });
    } else {
      setState(() {
        message = "Usuário ou senha incorretos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(30, 113, 180, 1),
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 80,
              color: const Color.fromRGBO(30, 113, 180, 1),
            ),
            const SizedBox(height: 20),

            // Campo de usuário
            SizedBox(
              width: 400,
              child: TextField(
                controller: user,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.account_circle),
                  hintText: "Digite seu usuário",
                  labelText: "Usuário",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Campo de senha
            SizedBox(
              width: 400,
              child: TextField(
                controller: password,
                obscureText: true, // Privar caracteres
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: "Digite seu usuário",
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),

            // Botão
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(30, 113, 180, 1),
                elevation: 3,
              ),
              child: Text("Entrar", style: TextStyle(color: Colors.white)),
            ),
            Text(
              "$message",
              style: TextStyle(color: const Color.fromRGBO(190, 58, 49, 1)),
            ), // Mostra o valor da menssage caso errar
          ],
        ),
      ),
    );
  }
}
