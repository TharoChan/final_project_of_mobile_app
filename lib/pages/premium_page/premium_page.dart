import 'package:flutter/material.dart';

class PremiumPage extends StatelessWidget {
  final double size;

  const PremiumPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Premium Page',
          style: TextStyle(fontSize: 18 + size),
        ),
      ),
    );
  }
}
