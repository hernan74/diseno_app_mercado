import 'package:flutter/material.dart';

class FondoBotonSeleccion extends StatelessWidget {
  final String texto;
  final Color colorFondo;
  final Color colorTexto;

  const FondoBotonSeleccion(
      {Key? key,
      required this.texto,
      required this.colorFondo,
      required this.colorTexto})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        //Borde redondeado superior
        Container(
          width: size.width * 0.263,
          height: size.height * 0.025,
          decoration: BoxDecoration(
              color: this.colorFondo, borderRadius: BorderRadius.circular(20)),
        ),
        //Borde redondeado inferior
        Container(
          width: size.width * 0.333,
          height: size.height * 0.07,
          child: CustomPaint(
            painter: _Diseno(this.colorFondo),
          ),
        ),
        //Texto boton
        Positioned(
          bottom: size.height * 0.015,
          child: Text(
            this.texto,
            style:
                TextStyle(fontSize: size.height * 0.02, color: this.colorTexto),
          ),
        )
      ],
    );
  }
}

class _Diseno extends CustomPainter {
  final Color colorFondo;

  _Diseno(this.colorFondo);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    //Propiedades
    paint.color = this.colorFondo;
    paint.style = PaintingStyle.fill; //stroke  fill
    paint.strokeWidth = 5;

    final path = new Path();

    path.lineTo(0, size.height * 0.29);
    path.quadraticBezierTo(size.width * 0.13, size.height * 0.3,
        size.width * 0.1, size.height * 0.8);
    path.lineTo(size.width * 0.9, size.height * 0.8);
    path.quadraticBezierTo(
        size.width * 0.88, size.height * 0.3, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
