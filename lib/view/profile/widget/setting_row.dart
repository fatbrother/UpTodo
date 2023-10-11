import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({
    super.key,
    required this.description,
    required this.icon,
    this.onTap,
  });

  final String description;
  final Widget icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            const SizedBox(width: 12),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ],
        ),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
