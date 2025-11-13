import 'package:flutter/material.dart';

class ProdutoPage extends StatelessWidget {
  final Map<String, dynamic> skin;

  const ProdutoPage({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2326),
        title: Text(skin['nome'], style: const TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Image.network(skin['imagem']),
            ),
            const SizedBox(height: 20),
            Text(
              skin['nome'],
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              'R\$ ${skin['preco']}',
              style: const TextStyle(color: Color(0xFFFF4655), fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context, skin),
              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
              label: const Text('Adicionar ao Carrinho'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF4655),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
