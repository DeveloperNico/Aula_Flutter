import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController novaTemperatura = TextEditingController();

  @override
  void initState() {
    super.initState();
    postValue();
  }

  String? erro;

  Future<void> postValue() async {
    // Lógica para postar o valor no Firestore
    try {
      FirebaseFirestore.instance.collection("monitoramento").add({
        "temperatura": novaTemperatura.text,
      });
    } catch(e) {
      setState(() {
        erro = "Erro ao enviar a temperatura";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Post Page")),
        body: Center(
          child: Column(children: [
            Text("Insira a sua temperatura"),
            TextField(
              controller: novaTemperatura,
            ),
            ElevatedButton(onPressed: postValue, child: Text("Enviar"))
          ]),
        ),
      ),
    );
  }
}