import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  final List<Map<String, dynamic>> carrinho;
  final Function(List<Map<String, dynamic>>) onFinalizar;

  const CarrinhoPage({super.key, required this.carrinho, required this.onFinalizar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      appBar: AppBar(
        title: const Text('Carrinho', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF1F2326),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: carrinho.isEmpty
          ? const Center(
              child: Text('Seu carrinho está vazio',
                  style: TextStyle(color: Colors.white70)),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrinho.length,
                    itemBuilder: (context, index) {
                      final item = carrinho[index];
                      return Card(
                        color: const Color(0xFF1F2326),
                        child: ListTile(
                          leading: Image.network(item['imagem']),
                          title: Text(item['nome'],
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text('R\$ ${item['preco']}',
                              style: const TextStyle(color: Color(0xFFFF4655))),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      onFinalizar(List.from(carrinho));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4655),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                    ),
                    child: const Text('Finalizar Compra',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                )
              ],
            ),
    );
  }
}
