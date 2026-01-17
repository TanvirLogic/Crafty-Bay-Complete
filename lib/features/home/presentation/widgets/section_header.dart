import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/extensions/localization_extension.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: .w600)),
        Spacer(),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            context.localizatons.seeAll,
            style: TextStyle(color: AppColors.themeColor),
          ),
        ),
      ],
    );
  }
}