import 'package:flutter/material.dart';
import 'Tela1.dart';
import 'Tela2.dart';
import 'Tela3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavBar(),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0; // Variável que indica a posição da tela desejada

  void changeIndex(int index) { // Função que muda a posição do index
    setState(() { // permite alterar o valor de variáveis
      currentIndex = index;
    });
  }

  List<Widget> screens = [ // Lista com as telas
    Tela1(),
    Tela2(),
    Tela3()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens.elementAt(currentIndex), // O conteúdo da tela será o index selecionado
        bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(label: "Tela 1", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Tela 2", icon: Icon(Icons.abc)),
          BottomNavigationBarItem(label: "Tela 3", icon: Icon(Icons.access_alarm))
        ],
        currentIndex: currentIndex,
        onTap: changeIndex,
        ),
      ),
    );
  }
}