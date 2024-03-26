import 'package:basic_operations_supabase/AppRoutes.dart';
import 'package:basic_operations_supabase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class RegisterProductPage extends StatefulWidget {
  const RegisterProductPage({Key? key}) : super(key: key);

  @override
  State<RegisterProductPage> createState() => _RegisterProductPageState();
}

class _RegisterProductPageState extends State<RegisterProductPage> {

  // Criação dos controllers para cada campo de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();


  @override
  void dispose() {
    // É importante limpar os controllers quando o widget for desmontado
    _nomeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Cadastrar Novo Produto', style: TextStyle(color: Colors.white),),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Permite a rolagem da tela
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            // Campo para o Nome Completo
            TextFormField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome Produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), // Espaço entre os campos
            // Campo para o Email
            TextFormField(
              controller: _descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição Produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                DatabaseOperations().insertProductRowSupabase(_nomeController.text, _descricaoController.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cadastro feito com sucesso! ')));
                print('Cadastrando...');
                Navigator.pushReplacementNamed(context, AppRoutes.homePage);
              },
              child: Text('Cadastrar', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
