import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key, required this.onChanged});
  final Function(File image) onChanged;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  File? image;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: (details) {
        if (image != null) {
          widget.onChanged(image!);
        }
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: IconButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                await pickerImageFromGallery();
                setState(() {
                  isLoading = false;
                });
              },
              icon:
                  image != null
                      ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.file(image!, fit: BoxFit.fill),
                      )
                      : Skeletonizer(
                        enabled: isLoading,
                        child: const Icon(Icons.image_outlined, size: 190),
                      ),
            ),
          ),
          Visibility(
            visible: image != null,
            child: IconButton(
              onPressed: () {
                setState(() {
                  image = null;
                  isLoading = false;
                });
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickerImageFromGallery() async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? pickerImage = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickerImage != null) {
        setState(() {
          image = File(pickerImage.path);
        });
        widget.onChanged(image!); // مهم تبعته على طول
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
