import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_bashbord/core/utils/app_color.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_button.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_bashbord/core/widgets/chack_box_item.dart';
import 'package:fruit_hub_bashbord/core/widgets/product_image.dart';
import 'package:fruit_hub_bashbord/feature/add_product/domain/entities/product_entity.dart';
import 'dart:io';

import 'package:fruit_hub_bashbord/feature/add_product/presentation/manager/add_proaduct_cubit/add_proaduct_cubit.dart';

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
  File? image;
  late bool isFeatured;
  late bool isOrganic;
  late int expirationMonths;
  late int numberOfCalories;
  late int unitAmount;

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
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'name',
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
                    hintText: 'price',
                    textInputType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                    textInputType: TextInputType.number,
                    hintText: 'Expiration months',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (p0) {
                      expirationMonths = int.tryParse(p0!) ?? 0;
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
                    textInputType: TextInputType.number,
                    hintText: 'Number of calories',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (p0) {
                      numberOfCalories = int.tryParse(p0!) ?? 0;
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
                    textInputType: TextInputType.number,
                    hintText: 'Unit Amount',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (p0) {
                      unitAmount = int.tryParse(p0!) ?? 0;
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
                    hintText: 'Code',
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
                  ChackBoxItem(
                    onChacked: (bool value) {
                      isFeatured = value;
                    },
                    titile: "Is Featured Item",
                  ),
                  SizedBox(height: 16),
                  ChackBoxItem(
                    onChacked: (bool value) {
                      isOrganic = value;
                    },
                    titile: 'Is Organic',
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

                        if (image != null) {
                          formKey.currentState!.save();
                          context.read<AddProaductCubit>().addProduct(
                            ProductEntity(
                              imageFile: image!,
                              name: name,
                              price: price.toString(),
                              code: code,
                              description: description,
                              isFeatured: isFeatured,
                              unitAmount: unitAmount,
                              expirationsMonths: expirationMonths,
                              numberOfCaloris: numberOfCalories,
                              isOrganic: isOrganic,
                            ),
                          );
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
