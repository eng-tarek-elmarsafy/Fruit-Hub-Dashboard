import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/utils/app_style.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_chack_box.dart';

class ChackBoxItem extends StatelessWidget {
  const ChackBoxItem({
    super.key,
    required this.onChacked,
    required this.titile,
  });
  final Function(bool value) onChacked;
  final String titile;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomChackBox(onChacked: onChacked),
        SizedBox(width: 16),
        Text(titile, style: AppStyle.basaBold.copyWith(color: Colors.black)),
      ],
    );
  }
}
