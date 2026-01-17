import 'package:crafty_bay/app/asset_paths.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:crafty_bay/features/common/presentation/widgets/theme_selector.dart';
import 'package:crafty_bay/features/home/presentation/widgets/home_carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/widgets/category_card.dart';
import '../../../common/presentation/widgets/product_card.dart';
import '../widgets/circle_icon_button.dart';
import '../widgets/product_search_field.dart';
import '../widgets/section_header.dart';

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
                HomeCarouselSlider(),
                SectionHeader(
                  title: context.localizatons.categories,
                  onTapSeeAll: () {
                    context.read<MainNavContainerProvider>().changeToCategory();
                  },
                ),
                buildCategoryList(),
                SectionHeader(
                  title: context.localizatons.popular,
                  onTapSeeAll: () {
                    context.read<MainNavContainerProvider>().changeToCategory();
                  },
                ),
                buildPopularList(),
                SectionHeader(
                  title: context.localizatons.special,
                  onTapSeeAll: () {
                    context.read<MainNavContainerProvider>().changeToCategory();
                  },
                ),
                buildSpecialList(),
                SectionHeader(
                  title: context.localizatons.newArrivals,
                  onTapSeeAll: () {
                    context.read<MainNavContainerProvider>().changeToCategory();
                  },
                ),
                buildNewList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buildNewList() {
    return SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => ProductCard(),
                ),
              );
  }

  SizedBox buildSpecialList() {
    return SizedBox(
                height: 165,
                child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) => ProductCard(),
                ),
              );
  }

  Widget buildPopularList() {
    return buildSpecialList();
  }

  Widget buildCategoryList() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: 4,
        itemBuilder: (context, index) => CategoryCard(),
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
