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
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late TextEditingController textController6;
  late TextEditingController textController7;

  late String name, code, description;
  late num price;
  File? image;
  late bool isFeatured = false;
  late bool isOrganic = false;
  late int expirationMonths;
  late int numberOfCalories;
  late int unitAmount;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController1.dispose();
    textController2.dispose();
    textController3.dispose();
    textController4.dispose();
    textController5.dispose();
    textController6.dispose();
    textController7.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  CustomTextFormField(
                    textController: textController1,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController2,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController3,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController4,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController5,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController6,
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
                  const SizedBox(height: 16),
                  CustomTextFormField(
                    textController: textController7,
                    hintText: 'Description',
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
                  const SizedBox(height: 16),
                  ChackBoxItem(
                    onChacked: (bool value) {
                      isFeatured = value;
                    },
                    titile: "Is Featured Item",
                  ),
                  const SizedBox(height: 16),
                  ChackBoxItem(
                    onChacked: (bool value) {
                      isOrganic = value;
                    },
                    titile: 'Is Organic',
                  ),
                  const SizedBox(height: 16),
                  ProductImage(
                    onChanged: (File xImage) {
                      image = xImage;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'Add data',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('يجب اختيار صورة'),
                              backgroundColor: AppColor.green500,
                            ),
                          );
                          return;
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
                          textController1.clear();
                          textController2.clear();
                          textController3.clear();
                          textController4.clear();
                          textController5.clear();
                          textController6.clear();
                          textController7.clear();
                          formKey.currentState!.reset();
                          image = null;
                          isFeatured = false;
                          isOrganic = false;
                          autovalidateMode = AutovalidateMode.disabled;
                          setState(() {});
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
