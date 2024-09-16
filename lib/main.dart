import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Notas de Filmes e Séries',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notas de Filmes e Séries'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Lista que armazenará as classificações de filmes/séries
  List<Map<String, dynamic>> classificacoes = [];

  // Controladores para o título e comentário
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();

  double _nota = 5.0; // Nota inicial

  // Função para adicionar classificação
  void _adicionarClassificacao() {
    setState(() {
      classificacoes.add({
        'titulo': _tituloController.text,
        'nota': _nota,
        'comentario': _comentarioController.text,
      });
      // Limpar campos após adicionar
      _tituloController.clear();
      _comentarioController.clear();
      _nota = 5.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _tituloController,
              decoration: const InputDecoration(
                labelText: 'Título do Filme/Série',
              ),
            ),
            Slider(
              value: _nota,
              min: 0,
              max: 10,
              divisions: 20,
              label: _nota.toString(),
              onChanged: (double value) {
                setState(() {
                  _nota = value;
                });
              },
            ),
            Text('Nota: ${_nota.toStringAsFixed(1)}'),
            TextField(
              controller: _comentarioController,
              decoration: const InputDecoration(
                labelText: 'Comentário',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarClassificacao,
              child: const Text('Adicionar Classificação'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: classificacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(classificacoes[index]['titulo']),
                      subtitle: Text(
                          'Nota: ${classificacoes[index]['nota'].toStringAsFixed(1)}\nComentário: ${classificacoes[index]['comentario']}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
