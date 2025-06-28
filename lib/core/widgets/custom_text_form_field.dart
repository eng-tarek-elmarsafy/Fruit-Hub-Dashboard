import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_hub_bashbord/core/utils/app_color.dart';
import 'package:fruit_hub_bashbord/core/utils/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.textInputType,
    required this.hintText,
    this.suffixIcon,
    this.onSaved,
    this.validator,
    this.obscureText = false,
    this.maxLines,
    this.inputFormatters,
    this.textController,
  });
  final TextInputType? textInputType;
  final String hintText;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? textController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      inputFormatters: inputFormatters,
      maxLines: maxLines,
      onSaved: onSaved,
      validator: validator,
      obscureText: obscureText,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: AppStyle.smallBold.copyWith(color: AppColor.gray400),
        filled: true,
        fillColor: const Color(0xffF9FAFA),
        border: _outlineInputBorder(),
        enabledBorder: _outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(color: Color(0xffE6E9EA), width: 1),
    );
  }
}
