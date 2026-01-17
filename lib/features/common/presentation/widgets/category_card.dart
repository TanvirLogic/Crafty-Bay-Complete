import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Card(
            elevation: 0,
            color: AppColors.themeColor.withAlpha(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Icon(Icons.computer, color: AppColors.themeColor),
            ),
          ),
        ),
        SizedBox(
          height: 15,
          child: Text(
            context.localizatons.profile,
            style: TextStyle(color: AppColors.themeColor),
          ),
        ),

      ],
    );
  }
}
