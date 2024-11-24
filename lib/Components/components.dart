import 'package:flutter/material.dart';

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateToFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}