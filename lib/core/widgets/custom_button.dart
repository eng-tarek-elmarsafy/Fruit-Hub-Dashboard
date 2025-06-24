import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/utils/app_color.dart';
import 'package:fruit_hub_bashbord/core/utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green1_500,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Text(title, style: AppStyle.basaBold),
      ),
    );
  }
}
