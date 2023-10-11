import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          width: double.infinity,
          height: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Center(
          child: Container(
            width: 24,
            height: 24,
            color: Theme.of(context).colorScheme.background,
            margin: const EdgeInsets.only(top: 12),
            child: Center(
              child: Text(
                'or',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(
                      color:
                          Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
