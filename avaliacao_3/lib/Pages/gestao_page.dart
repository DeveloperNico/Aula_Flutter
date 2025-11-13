import 'package:flutter/material.dart';

class GestaoPage extends StatefulWidget {
  final List<Map<String, dynamic>> skins;
  final List<Map<String, dynamic>> pedidos;

  const GestaoPage({super.key, required this.skins, required this.pedidos});

  @override
  State<GestaoPage> createState() => _GestaoPageState();
}

class _GestaoPageState extends State<GestaoPage> {
  late List<Map<String, dynamic>> _skins;
  late List<Map<String, dynamic>> _pedidos;

  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final imagemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _skins = List<Map<String, dynamic>>.from(widget.skins);
    _pedidos = List<Map<String, dynamic>>.from(widget.pedidos);
  }

  void adicionarSkin() {
    final nome = nomeController.text.trim();
    final precoTexto = precoController.text.trim();
    final imagem = imagemController.text.trim();

    if (nome.isEmpty || precoTexto.isEmpty || imagem.isEmpty) return;

    final preco = double.tryParse(precoTexto) ?? 0.0;

    setState(() {
      _skins.add({'nome': nome, 'preco': preco, 'imagem': imagem});
      nomeController.clear();
      precoController.clear();
      imagemController.clear();
    });
  }

  void editarSkin(int index) {
    final skin = _skins[index];
    nomeController.text = skin['nome'];
    precoController.text = skin['preco'].toString();
    imagemController.text = skin['imagem'];
    setState(() => _skins.removeAt(index));
  }

  void removerSkin(int index) {
    setState(() => _skins.removeAt(index));
  }

  void mostrarPedidos() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1F2326),
        title: const Text('Pedidos Realizados',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        content: SizedBox(
          width: double.maxFinite,
          child: _pedidos.isEmpty
              ? const Text('Nenhum pedido ainda.',
                  style: TextStyle(color: Colors.white70))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: _pedidos.length,
                  itemBuilder: (context, index) {
                    final p = _pedidos[index];
                    return Card(
                      color: const Color(0xFF0F1923),
                      child: ListTile(
                        leading: Image.network(p['imagem']),
                        title: Text(p['nome'],
                            style: const TextStyle(color: Colors.white)),
                        subtitle: Text('R\$ ${p['preco']}',
                            style: const TextStyle(color: Color(0xFFFF4655))),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _pedidos.removeAt(index);
                            });
                            Navigator.pop(context);
                            mostrarPedidos();
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fechar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, {'skins': _skins, 'pedidos': _pedidos});
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F1923),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F2326),
          title: const Text('Gestão de Skins',
              style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: const Icon(Icons.receipt_long, color: Colors.white),
              tooltip: 'Ver pedidos',
              onPressed: mostrarPedidos,
            ),
            IconButton(
              icon: const Icon(Icons.check, color: Colors.white),
              tooltip: 'Salvar e voltar',
              onPressed: () =>
                  Navigator.pop(context, {'skins': _skins, 'pedidos': _pedidos}),
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
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Nome da Skin',
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF4655)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: precoController,
                      style: const TextStyle(color: Colors.white),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Preço',
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF4655)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    child: TextField(
                      controller: imagemController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'URL da Imagem',
                        labelStyle: TextStyle(color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFF4655)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: adicionarSkin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF4655),
                    ),
                    child: const Text('Adicionar'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _skins.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhuma skin cadastrada.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _skins.length,
                        itemBuilder: (context, index) {
                          final s = _skins[index];
                          return Card(
                            color: const Color(0xFF1F2326),
                            child: ListTile(
                              leading: Image.network(s['imagem']),
                              title: Text(s['nome'],
                                  style: const TextStyle(color: Colors.white)),
                              subtitle: Text('R\$ ${s['preco']}',
                                  style: const TextStyle(
                                      color: Color(0xFFFF4655))),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.orange),
                                    onPressed: () => editarSkin(index),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () => removerSkin(index),
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
