import 'package:fixitpro/common/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const _PurpleBox(),
            // _HeaderIcon(),
            child,
          ],
        ));
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
    );
  }

  BoxDecoration _purpleBackground() {
    return const BoxDecoration(color: AppTheme.primary);
  }
}
