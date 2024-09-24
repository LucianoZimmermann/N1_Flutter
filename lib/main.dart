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
        // Definindo a paleta de cores personalizada
        colorScheme: ColorScheme(
          primary: const Color(0xFF96d7eb),
          onPrimary: Colors.white,
          secondary: const Color(0xFF686466),
          onSecondary: Colors.white,
          background: const Color(0xFF96d7eb),
          onBackground: Colors.black,
          surface: const Color(0xFFf2e4f9),
          onSurface: Colors.black,
          error: Colors.red,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Filmes Em Aplicativo Flutter'),
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
  List<Map<String, dynamic>> classificacoes = [];
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _comentarioController = TextEditingController();
  double _nota = 5.0;
  bool _ordenarPor= false; // Switch para ordenar por título ou nota

  void _adicionarClassificacao() {
    setState(() {
      classificacoes.add({
        'titulo': _tituloController.text,
        'nota': _nota,
        'comentario': _comentarioController.text,
      });
      _tituloController.clear();
      _comentarioController.clear();
      _nota = 5.0;
    });
  }

  // Função para navegação aos detalhes
  void _mostrarDetalhes(Map<String, dynamic> classificacao) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalhesPage(classificacao: classificacao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ordenando a lista com base no switch
    List<Map<String, dynamic>> classificacoesOrdenadas = [...classificacoes];
    if (_ordenarPor) {
      classificacoesOrdenadas.sort((a, b) => b['nota'].compareTo(a['nota']));
    } else {
      classificacoesOrdenadas.sort((a, b) => a['titulo'].compareTo(b['titulo']));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      // background com gradiente com todas as cores
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF686466),
              Color(0xFF839cb5),
              Color(0xFF96d7eb),
              Color(0xFFb1e1e9),
              Color(0xFFf2e4f9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _tituloController,
                decoration: const InputDecoration(
                  labelText: 'Título do Filme/Série',
                ),
              ),
              TextField(
                controller: _comentarioController,
                decoration: const InputDecoration(
                  labelText: 'Comentário',
                ),
              ),
              const SizedBox(height: 20),
              Text('Nota: ${_nota.toStringAsFixed(1)}'),
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
                activeColor: Theme.of(context).colorScheme.secondary,
              ),
              ElevatedButton(
                onPressed: _adicionarClassificacao,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ),
                child: const Text(
                  'Adicionar Classificação',
                  style: TextStyle(color: Colors.black), // Texto preto
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Ordenar por título'),
                  Switch(
                    value: _ordenarPor,
                    onChanged: (bool value) {
                      setState(() {
                        _ordenarPor = value;
                      });
                    },
                    activeColor: Theme.of(context).colorScheme.secondary,
                  ),
                  const Text('Ordenar por nota'),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: classificacoesOrdenadas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Theme.of(context).colorScheme.surface, // Cor do card
                      child: ListTile(
                        title: Text(classificacoesOrdenadas[index]['titulo']),
                        subtitle: Text(
                            'Nota: ${classificacoesOrdenadas[index]['nota'].toStringAsFixed(1)}\nComentário: ${classificacoesOrdenadas[index]['comentario']}'),
                        onTap: () => _mostrarDetalhes(classificacoesOrdenadas[index]),
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

class DetalhesPage extends StatelessWidget {
  final Map<String, dynamic> classificacao;

  const DetalhesPage({super.key, required this.classificacao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classificacao['titulo']),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  classificacao['titulo'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Nota: ${classificacao['nota'].toStringAsFixed(1)}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Comentário:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                Text(
                  classificacao['comentario'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
