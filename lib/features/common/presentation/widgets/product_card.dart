import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';
import '../../../../app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        elevation: 3,
        shadowColor: AppColors.themeColor.withAlpha(50),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        child: Column(
          children: [
            Container(
              width: 140,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: .circular(8),
                  topRight: .circular(8),
                ),
                color: AppColors.themeColor.withAlpha(30),
                image: DecorationImage(
                  image: AssetImage(AssetPaths.shoe_png),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Nike Shoe',
                    maxLines: 1,
                    style: TextStyle(overflow: .ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        '${Constants.takaSign}234',
                        style: TextStyle(fontWeight: .w600),
                      ),
                      Wrap(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          Text('4.5'),
                        ],
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(4),
                        ),
                        color: AppColors.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(
                            Icons.favorite_outline,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
