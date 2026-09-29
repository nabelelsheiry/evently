import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/features/profile/profile_widget.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  static const routeName = "Profile";
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppLanguageProvider>(context);
    bool isDark = provider.theme == "dark";
    return Scaffold(
      backgroundColor:isDark? AppColors.scaffoldDark2 : AppColors.scaffold,
      floatingActionButton: FloatingActionButton(onPressed: (){},
        shape: ShapedInputBorder(shape: StadiumBorder()),
        backgroundColor: AppColors.primary,
        child: Icon(Icons.add,color: AppColors.white,),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24,),
              const CircleAvatar(
                backgroundImage: AssetImage(AppAssets.routeLogo),
                radius: 50,
              ),
              const SizedBox(height: 12,),
               Text("Nabil El bono", style: theme.textTheme.titleMedium),
              const SizedBox(height: 5,),
              Text("johnsafwat.route@gmail.com",style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.greyDark),),
              const SizedBox(height: 32),
              ProfileWidget(text: "Dark mode",
                  textColor: isDark? AppColors.white:AppColors.black,
                  color: isDark ? AppColors.primaryDark2: AppColors.white,
                  widget: Switch(
                value: isDark,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xFF5669FF),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey.shade300,
                    trackOutlineColor: MaterialStateProperty.resolveWith(
                          (final Set<MaterialState> states) {
                        if (states.contains(MaterialState.selected)) {
                          return null;
                        }

                        return AppColors.white;
                      },
                    ),
                onChanged: (value) {
                  provider.changeTheme(value ? "dark" : "light");
                },
              )),
              const SizedBox(height: 16,),
              ProfileWidget(text: "Language",
                  textColor: isDark? AppColors.white:AppColors.black,
                  color: isDark ? AppColors.primaryDark2: AppColors.white,
                  widget: Icon(Icons.arrow_forward_ios_rounded,size :24,color:isDark?AppColors.primaryDark: AppColors.black,)),
              const SizedBox(height: 16,),
              ProfileWidget(text: "Logout",
                  textColor: isDark? AppColors.white:AppColors.black,
                  color: isDark ? AppColors.primaryDark2: AppColors.white,
                  widget: Icon(Icons.logout_outlined,color: AppColors.red,size: 24,)),
              


            ],
          ),
        ),
      ),
    );
  }
}
