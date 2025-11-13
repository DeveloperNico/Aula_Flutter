import 'package:appbanco/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async { // void main() assíncrono pois espera inicializar o flutter
  WidgetsFlutterBinding.ensureInitialized(); // Inicializar os componetes.
  await Firebase.initializeApp( // Aguarda o firebase inicializar
    options: DefaultFirebaseOptions.currentPlatform, 
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaGet(),
    );
  }
}

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  String? temperatura;

  @override
  void initState() {
    super.initState();
    getValue();
  }

  void getValue() {
    // Crio uma instância da coleção monitoramento, os retornos (snapshot) vou listar (listen)
    FirebaseFirestore.instance.collection("monitoramento").snapshots().listen(
      (snapshot) {
        final data = snapshot.docs.first.data(); // Pego o primeiro documento 

        setState(() {
          temperatura = data["temperatura"]; // Atualizo a variável temperatura com o valor do campo temperatura
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela de Get Firebase"),),
        body: Center(
          child: Column(
            children: [
              Text("Essa é a sua temperatura do banco: "),
              Text("$temperatura"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage()));
              }, child: Text("Ir página de Post"))
            ],
          ),
        ),
      ),
    );
  }
}