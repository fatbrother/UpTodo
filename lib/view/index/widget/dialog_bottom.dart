import 'package:flutter/material.dart';

class DialogBottom extends StatelessWidget {
  const DialogBottom({
    super.key,
    required this.onConfirm,
    required this.onCancel,
    required this.confirmText,
  });

  final void Function() onConfirm;
  final void Function() onCancel;
  final String confirmText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: TextButton(
            onPressed: onCancel,
            child: Text(
              'Cancel',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
            ),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(8),
            ),
            child: Text(
              confirmText,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
