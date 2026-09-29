import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/features/favourite/favourite_tab.dart';
import 'package:evently/features/home/home_tab.dart';
import 'package:evently/features/profile/profile_tab.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> tabs = [
    const HomeTab(),
    const FavouriteTab(),
    const ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppLanguageProvider>(context);
    bool isDark = provider.theme == "dark";

    return Scaffold(
      body:tabs[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey,
          currentIndex: selectedIndex,
          backgroundColor:isDark ? AppColors.scaffoldDark2 : AppColors.white,
          onTap: (value) {
            selectedIndex = value;
            setState(() {

            });
          },
      items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.home)),label: "Home"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.favourite)),label: "Favourite"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.profile)),label: "Profile"),
      ]),
    );
  }
}
