import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaApi extends StatefulWidget {
  const TelaApi({super.key});

  @override
  State<TelaApi> createState() => _TelaApiState();
}

class _TelaApiState extends State<TelaApi> {
  String? valor; // Variável que receberá o valor de outro lugar (api)
  
  @override
  void initState() { // Função que possibilita o estado sempre quando entrar na página
    super.initState();
    getValor();
  }

  void getValor() async {
    final response = await http.get(Uri.parse(""));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

      ),
    );
  }
}