import 'package:flutter/material.dart';
import 'produto_page.dart';
import 'carrinho_page.dart';
import 'gestao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> skins = [
    {
      'nome': 'Vandal Prime',
      'preco': 180.0,
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwfZGw21jGR-q2_qh8bNl-TiuEKoI-I07Lxg&s',
    },
    {
      'nome': 'Phantom Oni',
      'preco': 220.0,
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsiyzK2AbpfREM99iOU6h0_l2Ls7l3DqnN5A&s',
    },
    {
      'nome': 'Vandal Kuronami',
      'preco': 250.0,
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLaALROASsxZEibqq1CBRRqDw-2-KHXWeiNQ&s',
    },
  ];

  List<Map<String, dynamic>> carrinho = [];
  List<Map<String, dynamic>> pedidos = [];

  void abrirCarrinho() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarrinhoPage(
          carrinho: carrinho,
          onFinalizar: (pedidosFinalizados) {
            setState(() {
              pedidos.addAll(pedidosFinalizados);
              carrinho.clear();
            });
          },
        ),
      ),
    );
  }

  void abrirGestao() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GestaoPage(
          skins: List.from(skins),
          pedidos: List.from(pedidos),
        ),
      ),
    );

    if (resultado != null && mounted) {
      setState(() {
        skins = resultado['skins'];
        pedidos = resultado['pedidos'];
      });
    }
  }

  void abrirProduto(Map<String, dynamic> skin) async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProdutoPage(skin: skin),
      ),
    );

    if (resultado != null) {
      setState(() {
        carrinho.add(resultado);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1923),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2326),
        title: const Text("Valorant Skins", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: abrirCarrinho,
          ),
          IconButton(
            icon: const Icon(Icons.admin_panel_settings, color: Colors.white),
            onPressed: abrirGestao,
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: skins.length,
        itemBuilder: (context, index) {
          final skin = skins[index];
          return GestureDetector(
            onTap: () => abrirProduto(skin),
            child: Card(
              color: const Color(0xFF1F2326),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Color(0xFFFF4655), width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(skin['imagem'], fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    skin['nome'],
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'R\$ ${skin['preco']}',
                    style: const TextStyle(color: Color(0xFFFF4655)),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
