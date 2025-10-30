import 'dart:convert';

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

  void getValor() async { //aqui nao muda a ordem para criar a função
    final response = await http.get(Uri.parse("https://swapi.dev/api/people/1"));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body); //transforme json em string para manipular
      setState(() {
        //valor = data[]
        //valor = data[1]["color"]; // quando queremos pegar um elemento em especifico da api
        valor = data["name"];
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // se o valor for nulo, terá um loading
        body: valor == null ? Center(child: CircularProgressIndicator()) : 
        Center( child: Text("$valor"),)
      )
    );
  }
}