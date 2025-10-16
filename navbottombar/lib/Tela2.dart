import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Quedas'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5, // futuramente substituído por dados reais
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.warning, color: Colors.red),
              title: Text('Queda detectada'),
              subtitle: Text('Data: 12/10/2025 - 14:30'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // futuramente: abrir detalhes da queda
              },
            ),
          );
        },
      ),
    );
  }
}
