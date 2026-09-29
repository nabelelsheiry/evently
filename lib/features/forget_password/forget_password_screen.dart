import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/widgets/custom_outlined_button.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName = "ForgetPassword";
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppLanguageProvider>(context);
    bool isDark = provider.theme =="dark";
    return Scaffold(
      backgroundColor: isDark? AppColors.scaffoldDark2 : AppColors.scaffold,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
               Text("Forget Password",style:theme.textTheme.bodyLarge ,),
              const SizedBox(height: 34,),
              Image.asset(isDark? AppAssets.forgetPasswordDark : AppAssets.forgetPasswordLight),
              const SizedBox(height: 40,),
            CustomOutlinedButton(onPressed: (){},
            backgroundColor:isDark? AppColors.primaryDark: AppColors.primary,
                child: Center(child:  Text("Reset password",style: theme.textTheme.titleLarge,),))
            ],
          ),
        ),
      ),
    );
  }
}
