import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final double size;

  const SearchPage({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 18 + size),
        ),
      ),
    );
  }
}
