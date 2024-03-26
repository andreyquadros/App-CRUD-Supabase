import 'package:basic_operations_supabase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class ListProductsPage extends StatefulWidget {
  const ListProductsPage({Key? key}) : super(key: key);

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {
  List<String> produtos = [];

  Future<void> buscarNomes() async {
    List<String> listagemAuxiliarProdutos = [];
    listagemAuxiliarProdutos =
    await DatabaseOperations().listProductsRowSupabase();
    setState(() {
      produtos = listagemAuxiliarProdutos;
    });
  }

  void _showEditNameDialog(String nomeAtual, int index) {
    TextEditingController _nomeController = TextEditingController(text: nomeAtual);
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 200, // Define a altura do Dialog
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Editar Nome do Produto'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                ),
                child: Text('Salvar', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  setState(() {
                    produtos[index] = _nomeController.text;
                    DatabaseOperations().updateProductRowSupabase(nomeAtual, _nomeController.text);
                  });

                  Navigator.pop(context); // Fecha o Dialog
                },
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> excluirNome(String nome) async {
    await DatabaseOperations().deleteProductRowSupabase(nome);
    setState(() {
      produtos.removeWhere((produto) => produto == nome);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buscarNomes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Listar produtos',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueAccent,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  _showEditNameDialog(produtos[index], index);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.tealAccent,
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    excluirNome(produtos[index]);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  )),
              title: Text(
                produtos[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        },
      ),
    );
  }
}
