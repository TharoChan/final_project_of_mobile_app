import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final double size;

  const LibraryPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Library Page',
          style: TextStyle(fontSize: 18 + size),
        ),
      ),
    );
  }
}
