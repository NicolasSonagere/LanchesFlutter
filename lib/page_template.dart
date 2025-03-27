import 'package:desafio/home_screen.dart';
import 'package:flutter/material.dart';
import 'itens_model.dart';

class PageTemplate extends StatefulWidget {
  final Itens item;
  final List<Color> colors;

  const PageTemplate({super.key, required this.item, required this.colors});

  @override
  _PageTemplateState createState() => _PageTemplateState();
}

class _PageTemplateState extends State<PageTemplate> {
  int contador = 0;

  int get precoItem {
    if (widget.item.nome == 'Turbinado') return turbinado;
    if (widget.item.nome == 'Donuts da Joana') return Joana;
    if (widget.item.nome == 'Picolero') return Picolero;
    return 0;
  }

  int get precoTotal => contador * precoItem;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Definir espaçamentos proporcionais ao tamanho da tela
    double spacing = screenWidth * 0.05; // Aumenta conforme a tela cresce
    double imageSize = screenHeight * 0.15; // Tamanho das imagens adaptável
    double fontSize = screenWidth * 0.045; // Fonte ajustável

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: widget.colors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Container(
          width: screenWidth * 0.85,
          height: screenHeight * 0.75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(spacing * 0.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.item.foto, height: imageSize, fit: BoxFit.cover),
                SizedBox(height: spacing),

                Text(
                  widget.item.nome,
                  style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: spacing * 0.5),

                Text(
                  widget.item.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize * 0.8),
                ),
                SizedBox(height: spacing),

                // Separador responsivo
                Container(
                  margin: EdgeInsets.symmetric(vertical: spacing * 0.3),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(width: screenWidth * 0.7, height: 1.5, color: Colors.black54),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 1.5),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          widget.item.calorias,
                          style: TextStyle(fontSize: fontSize * 0.9, fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),

                // Itens secundários espaçados dinamicamente
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: spacing,
                  runSpacing: spacing * 0.5,
                  children: [
                    itemWidget(widget.item.item1_imagem, widget.item.item1_nome, screenWidth),
                    itemWidget(widget.item.item2_imagem, widget.item.item2_nome, screenWidth),
                    itemWidget(widget.item.item3_imagem, widget.item.item3_nome, screenWidth),
                  ],
                ),
                SizedBox(height: spacing),

                // Contador espaçado conforme a tela
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    botaoQuantidade(Icons.remove, Colors.red, () {
                      setState(() {
                        if (contador > 0) contador--;
                      });
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing * 0.4),
                      child: Text(
                        "$contador",
                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                      ),
                    ),
                    botaoQuantidade(Icons.add, Colors.green, () {
                      setState(() {
                        contador++;
                      });
                    }),
                  ],
                ),
                SizedBox(height: spacing),

                // Preço Total espaçado dinamicamente
                Container(
                  margin: EdgeInsets.symmetric(vertical: spacing * 0.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://cdn-icons-png.flaticon.com/512/709/709505.png',
                          width: screenWidth * 0.08, fit: BoxFit.cover),
                      SizedBox(width: spacing * 0.3),
                      Text(
                        "Total: R\$ $precoTotal",
                        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget para exibir os itens secundários de forma adaptável
  Widget itemWidget(String imageUrl, String name, double screenWidth) {
    double imageSize = screenWidth * 0.15; // Tamanho fixo para todas as imagens
    imageSize = imageSize.clamp(50, 80); // Limitando o tamanho mínimo e máximo

    return Column(
      children: [
        Container(
          width: imageSize,
          height: imageSize,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain, // Mantém a proporção original sem distorcer
          ),
        ),
        SizedBox(height: 5),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: screenWidth * 0.035, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }


  // Widget para os botões de adicionar/remover com espaçamento adaptável
  Widget botaoQuantidade(IconData icon, Color color, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, size: 25, color: color),
        onPressed: onPressed,
      ),
    );
  }
}
