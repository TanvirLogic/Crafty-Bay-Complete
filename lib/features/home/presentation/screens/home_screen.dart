import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/features/common/presentation/widgets/theme_selector.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/circle_icon_button.dart';
import '../widgets/product_search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: buildAppBar(),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(height: 100),
              ThemeSelector(),
              SizedBox(height: 100),
              LanguageSelector(),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 16,
              children: [
                ProductSearchField(),
                HomeCarouselSlider()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(AssetPaths.logo_nav_Svg),
          Spacer(),
          CircleIconButton(icon: Icon(Icons.person), onTapIconButton: () {}),
          CircleIconButton(icon: Icon(Icons.phone), onTapIconButton: () {}),
          CircleIconButton(
            icon: Icon(Icons.notifications),
            onTapIconButton: () {},
          ),
        ],
      ),
    );
  }
}


