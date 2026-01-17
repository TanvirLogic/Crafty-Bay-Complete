import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/presentation/providers/main_nav_container_provider.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});
  static const String name = '/category-list-screen';
  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        context.read<MainNavContainerProvider>().changeToHome();
      },
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.read<MainNavContainerProvider>().changeToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text(context.localizatons.categories),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (context, index) => CategoryCard(),
          ),
        ),
      ),
    );
  }
}
