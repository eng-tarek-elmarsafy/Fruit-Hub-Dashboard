import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/utils/app_style.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text('Add Prodact', style: AppStyle.heading5Bold),
    centerTitle: true,
  );
}
