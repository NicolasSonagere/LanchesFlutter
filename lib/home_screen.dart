import 'package:flutter/material.dart';
import 'itens_model.dart';
import 'page_template.dart';

int turbinado = 45;
int Joana = 20;
int Picolero = 12;

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();


  final List<Itens> listaItens = [
    Itens(
      nome: 'Turbinado',
      foto: 'https://cdn3d.iconscout.com/3d/premium/thumb/hamburguer-8681314-6984606.png?f=webp',
      descricao: '- Hamburgeria artesanal -',
      calorias: '560 kcal / R\$ $turbinado',
      item1_nome: 'Pão',
      item1_imagem: 'https://images.vexels.com/content/203685/preview/bread-white-bread-icon-e41368.png',
      item2_nome: 'Carne',
      item2_imagem: 'https://i.etsystatic.com/25240952/r/il/f8fca0/4311333682/il_570xN.4311333682_qn20.jpg',
      item3_nome: 'Queijo',
      item3_imagem: 'https://images.vexels.com/media/users/3/219856/isolated/preview/43eb5662fc446525203528d8d9aa90ed-fatia-de-queijo-leiteira-plana.png',
    ),
    Itens(
      nome: 'Donuts da Joana',
      foto: 'https://www.creativefabrica.com/wp-content/uploads/2022/07/14/Donut-clipart-SVG-Template-Cut-files-Graphics-34132070-2-580x411.png',
      descricao: '- Donuts caseiros -',
      calorias: '420 kcal / R\$ $Joana',
      item1_nome: 'Farinha',
      item1_imagem: 'https://images.vexels.com/media/users/3/257690/isolated/preview/ff6b1a9a9e0975d46a926072fecd19a0-ingrediente-de-cozimento-do-saco-de-farinha.png',
      item2_nome: 'Açucar',
      item2_imagem: 'https://images.vexels.com/media/users/3/141289/isolated/preview/06fb31b009016a7fe4a11bc3afafb242-pote-de-acucar.png',
      item3_nome: 'Ovo',
      item3_imagem: 'https://img.freepik.com/vetores-gratis/um-ovo-em-estilo-cartoon_1308-111705.jpg',
    ),
    Itens(
      nome: 'Picolero',
      foto: 'https://static.wikia.nocookie.net/hayday/images/a/af/Sorvete_de_chocolate.webp/revision/latest?cb=20240521235218&path-prefix=pt-br',
      descricao: '- Sorvato de milhor -',
      calorias: '210 kcal / R\$ $Picolero',
      item1_nome: 'Leite',
      item1_imagem: 'https://images.vexels.com/media/users/3/259857/isolated/preview/fad99aae53fa0706f15e75a950e93d4e-caixa-de-leite-com-vaca.png',
      item2_nome: 'Chocolate',
      item2_imagem: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmbFvt4uh24JF8TWr152r7Av2IkamYzbgspg&s',
      item3_nome: 'Frutas',
      item3_imagem: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPhbVBCWmGbxmVm_iHHViQPC18NGdH80bJTg&s',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          PageTemplate(item: listaItens[0], colors: [Colors.blue, Colors.lightBlueAccent]),
          PageTemplate(item: listaItens[1], colors: [Colors.lightBlueAccent, Colors.lightBlueAccent]),
          PageTemplate(item: listaItens[2], colors: [Colors.lightBlueAccent, Colors.blue]),
        ],
      ),
    );
  }
}
