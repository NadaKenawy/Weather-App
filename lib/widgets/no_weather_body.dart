import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off,
              color: Colors.blueGrey,
              size: 100,
            ),
            const SizedBox(height: 16),
            Text(
              'There is no weather',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start searching now',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blueGrey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
