import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int numero = 0;

  void aumentar(){
    setState(() {
      numero++;
    });
  }

  void diminuir(){
    setState(() {
      numero--;
    });
  }

  void resetar(){
    setState(() {
      numero = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text("App Contador do Nico", 
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)), 
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(104, 187, 243, 1),
        toolbarHeight: 180,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${numero.toInt()}", style: TextStyle(fontSize: 40, )),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                ElevatedButton(onPressed: (){
                  aumentar();
                } , child: Text("Aumentar")),
                ElevatedButton(onPressed: (){diminuir();} , child: Text("Diminuir")),
                ElevatedButton(onPressed: (){resetar();} , child: Text("Resetar"))
              ],)
            ],
          )
        ),
      ),
    );
  }
}
