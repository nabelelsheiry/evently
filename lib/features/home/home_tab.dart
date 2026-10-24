
import 'package:evently/features/home/tabbar_widget.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
    return Scaffold(
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
                TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  // indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 4),

                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(30),
                  ),


                  labelColor: Colors.white,
                  unselectedLabelColor: AppColors.primary,

                  tabs: [
                    TabbarWidget(
                      title: "All",
                      icon: Icons.grid_view,
                    ),
                    TabbarWidget(
                      title: "Sport",
                      icon: Icons.directions_bike_outlined,
                    ),
                    TabbarWidget(
                      title: "Birthday",
                      icon: Icons.cake_outlined,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
