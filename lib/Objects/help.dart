import 'package:flutter/material.dart';

String? userMessage;

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => showModalBottomSheet(
              backgroundColor: Colors.white70,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  color: Colors.white70,
                  child: Row(
                    children: [
                      TextField(
                        onChanged: (message) {
                          userMessage = message;
                        },
                      ),
                      const Icon(Icons.send),
                    ],
                  ),
                ),
              ),
            ),
        icon: const Icon(Icons.help_outline));
  }
}
