import 'package:basic_operations_supabase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class ListSupplierPage extends StatefulWidget {
  const ListSupplierPage({Key? key}) : super(key: key);

  @override
  State<ListSupplierPage> createState() => _ListSupplierPageState();
}

class _ListSupplierPageState extends State<ListSupplierPage> {
  List<String> fornecedores = [];

  Future<void> buscarNomes() async {
    List<String> listagemAuxiliarFornecedores = [];
    listagemAuxiliarFornecedores =
    await DatabaseOperations().listSuppliersRowSupabase();
    setState(() {
      fornecedores = listagemAuxiliarFornecedores;
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
                decoration: InputDecoration(labelText: 'Editar Nome Fornecedor'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                ),
                child: Text('Salvar', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  setState(() {
                    fornecedores[index] = _nomeController.text;
                    DatabaseOperations().updateSupplierRowSupabase(nomeAtual, _nomeController.text);
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
    await DatabaseOperations().deleteSupplierRowSupabase(nome);
    setState(() {
      fornecedores.removeWhere((fornecedor) => fornecedor == nome);
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
          'Listar Fornecedores',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: fornecedores.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueAccent,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: GestureDetector(
                onTap: () {
                  _showEditNameDialog(fornecedores[index], index);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.tealAccent,
                ),
              ),
              trailing: GestureDetector(
                  onTap: () {
                    excluirNome(fornecedores[index]);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  )),
              title: Text(
                fornecedores[index],
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
