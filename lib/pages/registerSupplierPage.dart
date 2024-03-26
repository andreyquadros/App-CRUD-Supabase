import 'package:basic_operations_supabase/AppRoutes.dart';
import 'package:basic_operations_supabase/pages/database/databaseOperations.dart';
import 'package:flutter/material.dart';

class RegisterSupplierPage extends StatefulWidget {
  const RegisterSupplierPage({Key? key}) : super(key: key);

  @override
  State<RegisterSupplierPage> createState() => _RegisterSupplierPageState();
}

class _RegisterSupplierPageState extends State<RegisterSupplierPage> {

  // Criação dos controllers para cada campo de texto
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cnpjController = TextEditingController();
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void dispose() {
    // É importante limpar os controllers quando o widget for desmontado
    _nomeController.dispose();
    _emailController.dispose();
    _cnpjController.dispose();
    _dataInicioController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Cadastrar Novo Fornecedor', style: TextStyle(color: Colors.white),),
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
                labelText: 'Nome Fornecedor',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10), // Espaço entre os campos
            // Campo para o Email
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Campo para o CPF
            TextFormField(
              controller: _cnpjController,
              decoration: InputDecoration(
                labelText: 'CNPJ',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Campo para a Data de Nascimento
            TextFormField(
              controller: _dataInicioController,
              decoration: InputDecoration(
                labelText: 'Data de Início Fornecimento',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            // Campo para o Telefone
            TextFormField(
              controller: _telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                DatabaseOperations().insertSupplierRowSupabase(_nomeController.text, _emailController.text, _cnpjController.text, _dataInicioController.text, _telefoneController.text);
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
