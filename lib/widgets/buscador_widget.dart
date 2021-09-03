import 'package:diseno_app_mercado/global/environment.dart';
import 'package:flutter/material.dart';

class BuscadorWidget extends StatelessWidget {
  final String hintText;

  const BuscadorWidget({Key? key, required this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.05,
      width: size.width,
      decoration: BoxDecoration(
          color: Environment.colorFondo,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.grey,
          ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: size.height * 0.02,
              ),
              decoration: InputDecoration(
                hintText: this.hintText,
                hintStyle: TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
