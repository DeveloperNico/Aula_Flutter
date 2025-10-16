import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        centerTitle: true,
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Notificações'),
            subtitle: const Text('Receber alertas de quedas'),
            value: true,
            onChanged: (value) {
              // futuramente: salvar preferência
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Vibração'),
            subtitle: const Text('Fazer o celular vibrar em alertas'),
            value: true,
            onChanged: (value) {
              // futuramente: salvar preferência
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre o app'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'LifeGuard',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2025 Nicolas',
              );
            },
          ),
        ],
      ),
    );
  }
}
