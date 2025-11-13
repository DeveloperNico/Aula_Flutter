import 'package:flutter/material.dart';

class GestaoPage extends StatefulWidget {
  final List<Map<String, dynamic>> servicos;

  const GestaoPage({super.key, required this.servicos});

  @override
  State<GestaoPage> createState() => _GestaoPageState();
}

class _GestaoPageState extends State<GestaoPage> {
  late List<Map<String, dynamic>> _servicos;
  final nomeController = TextEditingController();
  final precoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _servicos = List<Map<String, dynamic>>.from(widget.servicos);
  }

  void adicionarServico() {
    final nome = nomeController.text.trim();
    final precoTexto = precoController.text.trim();

    if (nome.isNotEmpty && precoTexto.isNotEmpty) {
      final preco = double.tryParse(precoTexto) ?? 0.0;
      setState(() {
        _servicos.add({'nome': nome, 'preco': preco});
        nomeController.clear();
        precoController.clear();
      });
    }
  }

  void editarServico(int index) {
    nomeController.text = _servicos[index]['nome'];
    precoController.text = _servicos[index]['preco'].toString();

    setState(() {
      _servicos.removeAt(index);
    });
  }

  void removerServico(int index) {
    setState(() {
      _servicos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope( // 👈 Garante retorno ao apertar "voltar"
      onWillPop: () async {
        Navigator.pop(context, _servicos);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gestão do Comércio'),
          backgroundColor: Colors.teal,
          actions: [
            IconButton(
              icon: const Icon(Icons.check),
              tooltip: 'Salvar e voltar',
              onPressed: () => Navigator.pop(context, _servicos),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nomeController,
                      decoration: const InputDecoration(labelText: 'Nome do serviço'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: precoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: 'Preço'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: adicionarServico,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: _servicos.length,
                  itemBuilder: (context, index) {
                    final s = _servicos[index];
                    return Card(
                      child: ListTile(
                        title: Text(s['nome']),
                        subtitle: Text('R\$ ${s['preco']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.orange),
                              onPressed: () => editarServico(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removerServico(index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
