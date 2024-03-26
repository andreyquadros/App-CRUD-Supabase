import 'package:basic_operations_supabase/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DatabaseOperations {
  final supabase = Supabase.instance.client;

  Future<void> createNewUserEmailPass(String email, String senha) async {
    final AuthResponse res = await supabase.auth.signUp(
      email: '$email',
      password: '$senha',
    );
    final Session? session = res.session;
    final User? user = res.user;
    print(session);
    print(user);
  }

  Future<void> loginUserEmailPass(
      BuildContext context, String email, String senha) async {
    print('Dados recebidos por parametro: $email e $senha');
    final AuthResponse res =
        await supabase.auth.signInWithPassword(password: '$senha', email:'$email');
    print('Informações do usuário: ${res.user}');
    try {
      if (res.user == null) {
        _showErrorDialog(context, 'Erro de login');
      }
      if (res.user != null) {
        // Se o login for bem-sucedido e um usuário for retornado, navegue para a próxima tela
        print('Login bem-sucedido para o usuário: ${res.user!.id}');
        Navigator.pushReplacementNamed(context, AppRoutes.homePage);
      } else {
        // Caso não se encaixe nas condições acima, trate como falha genérica de login
        print('Falha no login. Por favor, tente novamente.');
        _showErrorDialog(
            context, 'Falha no login. Por favor, tente novamente.');
      }
    } catch (e) {
      // Tratamento de erros gerais, como problemas de rede
      print('Erro ao tentar fazer login: $e');
      print('Estrutura do user ${res.user}');
      _showErrorDialog(context,
          'Erro ao tentar fazer login. Verifique sua conexão e tente novamente.');
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Fecha o diálogo
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> logoutEmailPass() async {
    await supabase.auth.signOut();
  }

  Future<void> insertPersonRowSupabase(String nome, String email, String CPF,
      String data_nascimento, String telefone) async {
    await supabase.from('AppCadastrarPessoas').insert({
      'nome': nome,
      'email': email,
      'cpf': CPF,
      'data_nascimento': data_nascimento,
      'telefone': telefone
    });
  }

  Future<void> insertProductRowSupabase(String nome, String descricao) async {
    await supabase.from('Produtos').insert({
      'nome': nome,
      'descricao': descricao,
    });
  }

  Future<void> insertSupplierRowSupabase(String nome, String email, String CNPJ,
      String data_inicio, String telefone) async {
    await supabase.from('Fornecedores').insert({
      'nome': nome,
      'email': email,
      'cnpj': CNPJ,
      'data_inicio': data_inicio,
      'telefone': telefone
    });
  }

  Future<List<String>> listPersonsRowSupabase() async {
    List<String> nomes = [];

    final data = await supabase.from('AppCadastrarPessoas').select('nome');

    for (var pessoa in data) {
      nomes.add(pessoa['nome']);
    }
    return nomes;
  }

  Future<List<String>> listProductsRowSupabase() async {
    List<String> nomes = [];

    final data = await supabase.from('Produtos').select('nome');

    for (var pessoa in data) {
      nomes.add(pessoa['nome']);
    }
    return nomes;
  }

  Future<List<String>> listSuppliersRowSupabase() async {
    List<String> nomes = [];

    final data = await supabase.from('Fornecedores').select('nome');

    for (var pessoa in data) {
      nomes.add(pessoa['nome']);
    }
    return nomes;
  }

  Future<void> deletePersonRowSupabase(String nome) async {
    await supabase.from('AppCadastrarPessoas').delete().match({'nome': nome});
  }

  Future<void> deleteProductRowSupabase(String nome) async {
    await supabase.from('Produtos').delete().match({'nome': nome});
  }

  Future<void> deleteSupplierRowSupabase(String nome) async {
    await supabase.from('Fornecedores').delete().match({'nome': nome});
  }

  Future<void> updatePersonRowSupabase(String nome, String novoNome) async {
    await supabase
        .from('AppCadastrarPessoas')
        .update({'nome': novoNome}).match({'nome': nome});
  }

  Future<void> updateSupplierRowSupabase(String nome, String novoNome) async {
    await supabase
        .from('Fornecedores')
        .update({'nome': novoNome}).match({'nome': nome});
  }

  Future<void> updateProductRowSupabase(String nome, String novoNome) async {
    await supabase
        .from('Produtos')
        .update({'nome': novoNome}).match({'nome': nome});
  }
}
