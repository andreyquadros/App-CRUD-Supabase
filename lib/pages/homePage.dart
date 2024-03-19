import 'package:basic_operations_supabase/AppRoutes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Página Inicial', style: TextStyle(color: Colors.white),),
        elevation: 5,
        foregroundColor: Colors.white,
        centerTitle: true,

      ),
      body: Center(
        // GridView.builder cria uma grade de itens
        child: GridView.builder(
          padding: EdgeInsets.all(20),
          // Define o número de colunas
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          // Define a quantidade de itens
          itemCount: 6,
          itemBuilder: (context, index) {
            // Lista de ícones
            List<IconData> icons = [
              Icons.person_add, // Cadastrar Pessoa
              Icons.add_shopping_cart, // Cadastrar Produto
              Icons.account_balance, // Cadastrar Fornecedor
              Icons.list_alt, // Listar Pessoas
              Icons.line_style_rounded, // Listar Produtos
              Icons.featured_play_list_outlined, // Listar Fornecedor
            ];

            // Lista de títulos
            List<String> titles = [
              'Cadastrar Pessoa',
              'Cadastrar Produto',
              'Cadastrar Fornecedor',
              'Listar Pessoa',
              'Listar Produto',
              'Listar Fornecedor',
            ];
            // Retorna um GestureDetector para cada item da grade
            return GestureDetector(
              onTap: () {
                switch(index){
                  case 0: Navigator.pushNamed(context, AppRoutes.registerPersonPage);
                  break;

                  case 3: Navigator.pushNamed(context, AppRoutes.listPersonPage);
                  break;
                };
                // Aqui você pode adicionar a navegação para cada página
                // Exemplo: Navigator.push(context, MaterialPageRoute(builder: (context) => SuaPaginaDeCadastro()));
                print('Navegando para ${titles[index]}');
              },
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(icons[index], size: 80, color: Colors.white,),
                    Text(titles[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
