import 'package:flutter/material.dart';
import 'package:cozinhando_casa2/modelos/receita.dart';

class Detalhes extends StatelessWidget {

  final Receita receita;

  Detalhes({Key key, @required this.receita}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes(receita.foto),
          _construirTituloDetalhes(receita.titulo),
          _construirLinhaIconesDetalhes(receita.tempoPreparo, '${receita.porcoes} porções'),
          _construirSubtitulosDetalhes('Ingredientes'),
          _construirTextoDetalhes(receita.ingredientes),
          _construirSubtitulosDetalhes('Modo de preparo'),
          _construirTextoDetalhes(receita.modoPreparo)
        ],
      ),
      appBar: _construirAppBar('Cozinhando em Casa'),
    );
  }

  Widget _construirImagemDetalhes(String imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(String titulo) {
    return Center(
      child: Text(titulo, style: TextStyle(color: Colors.deepOrange, fontSize: 30)),
    );
  }

  Widget _construirSubtitulosDetalhes(String subtitulo) {
    return Center(
        child: Text(subtitulo, style: TextStyle(fontSize: 20))
    );
  }

  Widget _construirTextoDetalhes(String texto) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Text(texto)
    );
  }

  Widget _construirAppBar(String titulo) {
    return AppBar(title: Text(titulo));
  }

  Widget _construirLinhaIconesDetalhes(String tempo, String rendimento) {
    return Row(
      children: <Widget>[
        _construirColuna(tempo, Icons.timer),
        _construirColuna(rendimento, Icons.restaurant)
      ],
    );
  }

  Widget _construirColuna(String dado, IconData icone) {
    return  Expanded(
      child:
      Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Icon(icone, color: Colors.deepOrange),
              Text(dado, style: TextStyle(color: Colors.deepOrange,
                   fontWeight: FontWeight.bold, fontSize: 12)
              )],
          )
        )
    );
  }
}