
import 'package:evently/features/home/tabbar_widget.dart';
import 'package:evently/model/category_dm.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.scaf,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const SizedBox(height: 24,),
                Row(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Welcome Back ",style: theme.textTheme.bodySmall,),
                            Text("✨",style:  TextStyle( fontSize: 14,color: AppColors.yellow),),
                          ],
                        ),
                        const SizedBox(height: 4,),
                        Text("Nabil ELbono",style: theme.textTheme.titleLarge?.copyWith(color: AppColors.black),)
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.sunny,color: AppColors.primary,size: 30,),
                    const SizedBox(width: 8,),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(child: Text("EN",style: theme.textTheme.bodySmall?.copyWith(color: AppColors.white),),),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                CategoriesTabBar(categories: CategoryDM.allCategories, onTap: (category){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
