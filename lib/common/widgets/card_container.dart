import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;
  final double? width;

  const CardContainer({Key? key, required this.child, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Container(
          width: width ?? double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: _createCardShape(),
          child: child,
        ),
      ),
    );
  }

  BoxDecoration _createCardShape() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
              offset: Offset(0, 5),
            )
          ]);
}
