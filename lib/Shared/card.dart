import 'package:flutter/material.dart';
import 'package:lab_calculations/Shared/text.dart';

class BuildCard extends StatelessWidget {

String name;


BuildCard({
    required this.name,

});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.transparent,       
          child: Center(child: BuildText(text: name, color: Colors.amber[100], bold: true, size: 15)),
      ),
    );
  }
}