import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final String title;

  CustomCard({required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
            elevation: 10,
            color: const Color(0xff201634),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(title.toUpperCase(),
                        style: const TextStyle(
                            color: Color(0xFF4d4a5d),
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    child
                  ],
                ))));
  }
}
