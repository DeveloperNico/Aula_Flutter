import 'package:flutter/material.dart';
import 'gestao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> produtos = [
    {'nome': 'Corte de cabelo', 'preco': 30.0},
    {'nome': 'Barba', 'preco': 20.0},
    {'nome': 'Combo completo', 'preco': 45.0},
  ];

  Future<void> abrirGestao() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GestaoPage(servicos: List.from(produtos)),
      ),
    );

    // Atualiza a tela quando volta da página de gestão
    if (resultado != null && mounted) {
      setState(() {
        produtos = resultado;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produtos e Serviços'), backgroundColor: Colors.teal),
      body: produtos.isEmpty
          ? const Center(child: Text('Nenhum serviço cadastrado.'))
          : ListView.builder(
              itemCount: produtos.length,
              itemBuilder: (context, index) {
                final p = produtos[index];
                return Card(
                  child: ListTile(
                    title: Text(p['nome']),
                    subtitle: Text('R\$ ${p['preco']}'),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: abrirGestao,
        child: const Icon(Icons.manage_accounts),
      ),
    );
  }
}
