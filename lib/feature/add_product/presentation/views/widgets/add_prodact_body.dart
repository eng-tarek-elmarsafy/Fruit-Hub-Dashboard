import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/utils/app_color.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_button.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_bashbord/core/widgets/is_featured_item.dart';
import 'package:fruit_hub_bashbord/core/widgets/product_image.dart';
import 'dart:io';

class AddProdactBody extends StatefulWidget {
  const AddProdactBody({super.key});

  @override
  State<AddProdactBody> createState() => _AddProdactBodyState();
}

class _AddProdactBodyState extends State<AddProdactBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;

  late String name, code, description;
  late num price;
  late File? image;
  bool isFeatured = false;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Product name',
                    onSaved: (p0) {
                      name = p0!;
                    },
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Product price',
                    textInputType: TextInputType.number,
                    onSaved: (p0) {
                      price = num.parse(p0!);
                    },
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Product code',
                    onSaved: (p0) {
                      code = p0!.toLowerCase();
                    },
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomTextFormField(
                    hintText: 'Product Descirpiton',
                    maxLines: 5,
                    onSaved: (p0) {
                      description = p0!;
                    },
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  IsFeaturedItem(
                    onChacked: (bool value) {
                      isFeatured = value;
                    },
                  ),
                  SizedBox(height: 16),
                  ProductImage(
                    onChanged: (File xImage) {
                      image = xImage;
                    },
                  ),
                  SizedBox(height: 16),
                  CustomButton(
                    title: 'Add data',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('يجب اختيار صورة'),
                              backgroundColor: AppColor.green500,
                            ),
                          );
                        }
                        formKey.currentState!.save();
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
