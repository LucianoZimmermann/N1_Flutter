
# App de Notas de Filmes e Séries

Este projeto é um aplicativo em Flutter que permite ao usuário adicionar e visualizar classificações e comentários para filmes e séries. Ele oferece uma interface intuitiva e agradável, onde o usuário pode inserir o título de um filme ou série, dar uma nota em uma escala de 0 a 10, adicionar um comentário e ver uma lista com todas as classificações feitas. Além disso, o aplicativo conta com funcionalidades como ordenação das classificações e exibição de detalhes.

## Funcionalidades

- **Adicionar Classificação**: O usuário pode inserir o título de um filme/série, dar uma nota de 0 a 10 usando um Slider e escrever um comentário sobre o filme/série.
- **Visualizar Classificações**: As classificações são exibidas em uma lista que mostra o título, a nota e o comentário.
- **Ordenação por Nota ou Título**: Um switch permite ao usuário alternar entre a ordenação alfabética por título ou por nota, do maior para o menor.
- **Exibição de Detalhes**: Ao clicar em uma classificação, o usuário é levado para uma nova tela que mostra os detalhes completos da classificação, incluindo o título, a nota e o comentário.

## Estrutura do Projeto

### `main.dart`

O código é dividido em três classes principais:

### 1. `MyApp`
É a classe principal que inicia o aplicativo. Define o tema do app, incluindo cores personalizadas para os diferentes componentes da interface, como a AppBar, os cards, os botões e os fundos. Também usa o Material 3 para seguir os padrões de design mais recentes.

### 2. `MyHomePage`
Esta é a classe responsável pela tela principal do aplicativo, onde o usuário pode adicionar novas classificações e ver a lista de filmes e séries já classificados. Esta classe é **Stateful**, pois os dados das classificações e a interação do usuário mudam dinamicamente.

- **Classificações**: As classificações são armazenadas em uma lista de mapas (`List<Map<String, dynamic>>`), onde cada mapa contém o título, a nota e o comentário sobre um filme ou série.
- **Ordenação**: A ordenação da lista pode ser feita por título (alfabeticamente) ou por nota (em ordem decrescente), dependendo do estado do switch `_ordenarPorNota`.
- **Interação com o Usuário**: Os TextFields são usados para entrada de título e comentário, e um Slider para selecionar a nota. Um botão permite adicionar a classificação à lista.

### 3. `DetalhesPage`
Esta classe é responsável por exibir os detalhes de uma classificação quando o usuário clica em uma entrada da lista de classificações. Ela recebe os dados da classificação como parâmetro e os exibe em um card estilizado.

## Temas e Estilos

O aplicativo utiliza uma paleta de cores personalizada. Algumas configurações notáveis incluem:

- **primary**: Um azul claro (`Color(0xFF96d7eb)`), usado como cor principal.
- **secondary**: Um cinza (`Color(0xFF686466)`), utilizado em elementos secundários como o Slider.
- **surface**: Um roxo claro (`Color(0xFFf2e4f9)`), usado como cor de fundo para os cards.
- **background**: Gradiente de cores suaves para o fundo da aplicação.

A aparência dos componentes é ajustada para seguir o Material Design 3, garantindo uma interface moderna e amigável.

## Gradiente de Fundo

O fundo da tela principal tem um gradiente personalizado que passa por várias tonalidades:

```dart
Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF686466), // Cinza
        Color(0xFF839cb5), // Azul acinzentado
        Color(0xFF96d7eb), // Azul claro
        Color(0xFFb1e1e9), // Azul mais claro
        Color(0xFFf2e4f9), // Roxo claro
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
)
```

## Estrutura dos Dados

As classificações são armazenadas em uma lista de mapas, onde cada mapa contém:
- `titulo`: String com o nome do filme/série.
- `comentario`: String com o comentário do usuário.
- `nota`: Double representando a nota de 0 a 10.

### Exemplo de Estrutura:

```dart
{
  'titulo': 'Interstellar',
  'comentario': 'Filme espetacular com ótimos efeitos visuais!',
  'nota': 9.5
}
```

## Como Rodar o Projeto

1. **Pré-requisitos**:
    - [Flutter SDK](https://flutter.dev/docs/get-started/install)
    - Um editor de código (como o [Visual Studio Code](https://code.visualstudio.com/) ou [Android Studio](https://developer.android.com/studio)).

2. **Passos**:
    - Clone o repositório ou copie o código para o seu ambiente local.
    - Navegue até o diretório do projeto no terminal.
    - Execute `flutter pub get` para instalar as dependências.
    - Execute `flutter run` para iniciar o aplicativo no emulador ou em um dispositivo físico.

## Estrutura de Arquivos

```
/lib
  └── main.dart       # Código principal do aplicativo
```

## Prints

![Prints](imagens/Captura de Tela (5).png)
![Prints](imagens/Captura de Tela (4).png)
