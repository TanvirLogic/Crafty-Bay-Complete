import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/asset_paths.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key, this.width, this.height});
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPaths.logoSvg,
      height: height,
      width: width ?? 100,
    );
  }
}
