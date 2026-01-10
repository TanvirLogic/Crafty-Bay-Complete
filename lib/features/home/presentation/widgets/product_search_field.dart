import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';

class ProductSearchField extends StatelessWidget {
  const ProductSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: context.localizatons.search,
        hintStyle: TextStyle(color: Colors.black),
        fillColor: Colors.grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}