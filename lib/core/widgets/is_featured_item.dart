import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_chack_box.dart';

class IsFeaturedItem extends StatelessWidget {
  const IsFeaturedItem({super.key, required this.onChacked});
  final Function(bool value) onChacked;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomChackBox(onChacked: onChacked),
        SizedBox(width: 16),
        Text("Is Featured Item"),
      ],
    );
  }
}