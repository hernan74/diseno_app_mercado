import 'package:diseno_app_mercado/models/producto_model.dart';
import 'package:flutter/material.dart';

class ItemProductoWidget extends StatelessWidget {
  final ProductoModel categoria;
  final List<ProductoModel> productos;

  const ItemProductoWidget({required this.categoria, required this.productos});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: ExpansionTile(
        title: _Title(categoria: this.categoria),
        children: <Widget>[_ListadoItems(lista: this.productos)],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final ProductoModel categoria;

  const _Title({required this.categoria});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final estiloOferta = TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: size.height * 0.025);
    final estiloTitulo = TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: size.height * 0.02);
    final estiloSubTitulo =
        TextStyle(color: Colors.blueGrey, fontSize: size.height * 0.017);
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(right: size.width * 0.05),
            width: 60,
            height: 60,
            child: Image.asset(
              categoria.pathImagen,
              fit: BoxFit.fill,
            )),
        Container(
          width: size.width * 0.53,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(categoria.descuento, style: estiloOferta),
              Text(categoria.titulo, style: estiloTitulo),
              Container(
                width: size.width * 0.57,
                height: size.height * 0.05,
                child: Text(categoria.descripcion, style: estiloSubTitulo),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ListadoItems extends StatelessWidget {
  final List<ProductoModel> lista;

  const _ListadoItems({required this.lista});
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: this.lista.map((e) => _ItemWidget(item: e)).toList(),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final ProductoModel item;

  const _ItemWidget({required this.item});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
      margin: EdgeInsets.only(bottom: size.height * 0.01),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(bottom: size.height * 0.005),
              width: size.width * 0.3,
              height: size.height * 0.13,
              child: Image.asset(this.item.pathImagen, fit: BoxFit.cover)),
          Text(
            this.item.titulo,
            style: TextStyle(
                fontSize: size.height * 0.017,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey),
          ),
          SizedBox(height: size.height * 0.005)
        ],
      ),
    );
  }
}
