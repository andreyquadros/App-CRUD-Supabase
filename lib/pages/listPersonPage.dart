import 'package:basic_operations_supabase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class ListPersonPage extends StatefulWidget {
  const ListPersonPage({Key? key}) : super(key: key);

  @override
  State<ListPersonPage> createState() => _ListPersonPageState();
}

class _ListPersonPageState extends State<ListPersonPage> {
  List<String> pessoas = [];

  Future<void> buscarNomes() async {
    List<String> listagemAuxiliarPessoas = [];
    listagemAuxiliarPessoas =
        await DatabaseOperations().listPersonsRowSupabase();
    setState(() {
      pessoas = listagemAuxiliarPessoas;
    });
  }

  Future<void> excluirNome(String nome) async {
    await DatabaseOperations().deletePersonRowSupabase(nome);
    setState(() {
      pessoas.removeWhere((pessoa) => pessoa == nome);
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
          'Listar Pessoas',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: pessoas.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blueAccent,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(
                Icons.edit,
                color: Colors.tealAccent,
              ),
              trailing: GestureDetector(
                onTap: (){
                  excluirNome(pessoas[index]);
                },
                  child: Icon(
                Icons.delete,
                color: Colors.redAccent,
              )),
              title: Text(
                pessoas[index],
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
