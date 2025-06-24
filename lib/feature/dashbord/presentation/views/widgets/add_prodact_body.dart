import 'package:flutter/material.dart';
import 'package:fruit_hub_bashbord/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hub_bashbord/core/widgets/is_featured_item.dart';
import 'package:image_picker/image_picker.dart';

class AddProdactBody extends StatelessWidget {
  const AddProdactBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomTextFormField(hintText: 'Product name'),
                SizedBox(height: 16),
                CustomTextFormField(hintText: 'Product price'),
                SizedBox(height: 16),
                CustomTextFormField(hintText: 'Product code'),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: 'Product Descirpiton',
                  maxLines: 5,
                ),
                SizedBox(height: 16),
                IsFeaturedItem(onChacked: (bool value) {}),
                SizedBox(height: 16),
                ProductImage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(border: Border.all(color: Colors.green)),
      child: IconButton(
        onPressed: () async {
          final ImagePicker picker = ImagePicker();
          // Pick an image.
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );
        },
        icon: Icon(Icons.image_outlined, size: 190),
      ),
    );
  }
}
