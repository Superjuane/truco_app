import 'package:flutter/material.dart';

class Settings1Screen extends StatefulWidget {
  const Settings1Screen({super.key});

  final String title = "Truco App";

  @override
  State<Settings1Screen> createState() => _Settings1ScreenState();
}

class _Settings1ScreenState extends State<Settings1Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }
}