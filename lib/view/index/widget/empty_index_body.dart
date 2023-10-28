import 'package:flutter/material.dart';

class EmptyIndexBody extends StatelessWidget {
  const EmptyIndexBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset('assets/images/index.png', height: 300),
        Text(
          'What do you want to do today?',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Tap + to add your tasks',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ));
  }
}
