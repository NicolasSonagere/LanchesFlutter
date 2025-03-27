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
    if (widget.item.nome == 'Turbinado') {
      return turbinado;  // Preço do Turbinado
    } else if (widget.item.nome == 'Donuts da Joana') {
      return Joana;  // Preço do Donuts da Joana
    } else if (widget.item.nome == 'Picolero') {
      return Picolero;  // Preço do Picolero
    }
    return 0;
  }

  // Preço total
  int get precoTotal {
    return contador * precoItem;
  }

  @override
  Widget build(BuildContext context) {
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
          width: 400,
          height: 650,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(widget.item.foto, height: 150, fit: BoxFit.cover),
                SizedBox(height: 20),
                Text(
                  widget.item.nome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  widget.item.descricao,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 550,
                        height: 2,
                        color: Colors.black54,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26, width: 2),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: SizedBox(width: 150, height: 40),
                      ),
                      Text(
                        widget.item.calorias,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Image.network(widget.item.item1_imagem, width: 30, fit: BoxFit.cover),
                        Text(widget.item.item1_nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(widget.item.item2_imagem, width: 30, fit: BoxFit.cover),
                        Text(widget.item.item2_nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(widget.item.item3_imagem, width: 30, fit: BoxFit.cover),
                        Text(widget.item.item3_nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(Icons.remove, size: 30, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              if (contador > 0) contador--;
                            });
                          },
                        ),
                      ),

                      Text(
                        "$contador",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      Container(
                        padding: EdgeInsets.all(1),
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),

                        child: IconButton(
                          icon: Icon(Icons.add, size: 30, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              contador++;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://cdn-icons-png.flaticon.com/512/709/709505.png', width: 50, fit: BoxFit.cover),
                      SizedBox(width: 10),
                      Text("Total: R\$ $precoTotal", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                   ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
