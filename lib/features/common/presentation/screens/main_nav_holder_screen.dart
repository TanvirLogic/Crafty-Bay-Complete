import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/auth/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainNavHolderScreen extends StatefulWidget {
  const MainNavHolderScreen({super.key});
  static const String name = '/main-nav-bar-screen';
  @override
  State<MainNavHolderScreen> createState() => _MainNavHolderScreenState();
}

class _MainNavHolderScreenState extends State<MainNavHolderScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNavContainerProvider>(
      builder: (context, mainNavContainerProvider, child) {
        return Scaffold(
          body: _screens[mainNavContainerProvider.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: AppColors.themeColor,
            showUnselectedLabels: true,
            currentIndex: mainNavContainerProvider.selectedIndex,
            onTap: mainNavContainerProvider.changeIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: context.localizatons.home,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_customize),
                label: context.localizatons.dashboard,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: context.localizatons.cart,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline_rounded),
                label: context.localizatons.wishlist,
              ),
            ],
          ),
        );
      },
    );
  }
}
