import 'package:diseno_app_mercado/global/environment.dart';
import 'package:diseno_app_mercado/helpers/datos_prueba.dart';
import 'package:diseno_app_mercado/widgets/buscador_widget.dart';
import 'package:diseno_app_mercado/widgets/fondo_boton_seleccion.dart';
import 'package:diseno_app_mercado/widgets/item_producto_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Environment.colorFondo,
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket))
        ],
        backgroundColor: Environment.colorPrimario,
        elevation: 0,
        title: _ContenidoAppBar(),
      ),
      body: _ContenidoVista(),
    );
  }
}

class _ContenidoAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Estilos
    final estiloTitulo = TextStyle(
        fontSize: size.height * 0.024,
        color: Colors.white,
        fontWeight: FontWeight.bold);
    final estiloSubTitulo = TextStyle(
        fontSize: size.height * 0.019,
        color: Colors.white,
        fontWeight: FontWeight.bold);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Delivery Location', style: estiloTitulo),
      subtitle:
          Text('B52 Tecorbbuilding, sec-63 Noida', style: estiloSubTitulo),
    );
  }
}

class _ContenidoVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.31,
          child: Stack(
            children: [
              Positioned(bottom: 0, child: _Botones()),
              _Cabecera(),
            ],
          ),
        ),
        _Listado()
      ],
    );
  }
}

class _Botones extends StatefulWidget {
  const _Botones({
    Key? key,
  }) : super(key: key);

  @override
  __BotonesState createState() => __BotonesState();
}

class __BotonesState extends State<_Botones> {
  int seleccion = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              seleccion = 0;
            });
          },
          child: FondoBotonSeleccion(
            texto: 'Today Offers',
            colorFondo: (seleccion == 0)
                ? Environment.colorPrimario
                : Environment.colorFondo,
            colorTexto: (seleccion == 0) ? Colors.white : Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              seleccion = 1;
            });
          },
          child: FondoBotonSeleccion(
            texto: 'Categories',
            colorFondo: (seleccion == 1)
                ? Environment.colorPrimario
                : Environment.colorFondo,
            colorTexto: (seleccion == 1) ? Colors.white : Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              seleccion = 2;
            });
          },
          child: FondoBotonSeleccion(
            texto: 'Favorites',
            colorTexto: (seleccion == 2) ? Colors.white : Colors.black,
            colorFondo: (seleccion == 2)
                ? Environment.colorPrimario
                : Environment.colorFondo,
          ),
        )
      ],
    );
  }
}

class _Cabecera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.265,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BuscadorWidget(hintText: 'Search for Product'),
          Container(
            width: size.width,
            height: size.height * 0.18,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/imagen_cabecera.jpg',
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Environment.colorPrimario,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
    );
  }
}

class _Listado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(5),
        children: [
          ItemProductoWidget(categoria: categoria1, productos: listaProductos),
          SizedBox(height: 2),
          ItemProductoWidget(categoria: categoria2, productos: listaProductos)
        ],
      ),
    );
  }
}
