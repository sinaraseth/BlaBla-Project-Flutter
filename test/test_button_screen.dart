import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/widgets/actions/buttons/bla_button.dart';

class TestButtonScreen extends StatelessWidget {
  const TestButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Test Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Primary Button without icon
            BlaButton(
              text: 'Primary Button',
              type: 'PRIMARY',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Primary button pressed!')),
                );
              },
            ),
            const SizedBox(height: 16),

            // Primary Button with icon
            BlaButton(
              text: 'Primary with Icon',
              type: 'PRIMARY',
              icon: const Icon(Icons.message),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Primary icon button pressed!')),
                );
              },
            ),
            const SizedBox(height: 16),

            // Secondary Button without icon
            BlaButton(
              text: 'Secondary Button',
              type: 'SECONDARY',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Secondary button pressed!')),
                );
              },
            ),
            const SizedBox(height: 16),

            // Secondary Button with icon
            BlaButton(
              text: 'Secondary with Icon',
              type: 'SECONDARY',
              icon: const Icon(Icons.schedule),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Secondary icon button pressed!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Main function to run the test screen
void main() {
  runApp(
    const MaterialApp(
      home: TestButtonScreen(),
    ),
  );
}