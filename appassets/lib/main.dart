import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Tela2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaAssets(),
    );
  }
}

class TelaAssets extends StatelessWidget {
  const TelaAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tela Assets"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 100,
        ),

        body: Center(
          child: Column( // Coloca os elementos em coluna
            children: [ // Pode ter vários elementos
              Image.network("https://www.planocritico.com/wp-content/uploads/2020/11/Fora-de-Plano-Toy-Story-4.jpg", width: 500,),
              Text("Toy Story 4", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              Image.asset("assets/images/como-treinar-seu-dragao.png", width: 500,),
              Text("Como Treinar o Seu Dragão", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela2()));
              }, child: Icon(Icons.play_arrow_rounded))
            ],
          ),
        ),
      ),
    );
  }
}