import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/widgets/prime_widget.dart';
import 'package:evently/core/widgets/shared_button.dart';
import 'package:evently/features/login/login_screen.dart';
import 'package:evently/features/onboarding/theme_widget.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = "Onboard";
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   late  var provider = Provider.of<AppLanguageProvider>(context);
     late var theme = Theme.of(context);
     late var local = AppLocalizations.of(context)!;
     late bool isEnglish = provider.language == "en";
     late bool isLight = provider.theme == "light";
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Hero(
              tag: "hero",
              child: Center(child: Image.asset(AppAssets.eventlyLogo,width: 200,color: AppColors.primary,)),
          ),
              const SizedBox(height: 30,),
              Image.asset(AppAssets.onboard1Light,),
              const SizedBox(height: 24),
              Text(local.onboardingTitle1,style:theme.textTheme.titleMedium ,),
              const SizedBox(height: 8,),
              Text(local.onboardingDescription1,style: theme.textTheme.titleSmall,maxLines: 6,),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Text(local.language,style: theme.textTheme.bodyLarge,),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      //todo: change language
                      provider.changeLanguage("en");
                    },
                    child: PrimeWidget(isEnglish: isEnglish,
                      color: isEnglish? isLight? AppColors.primary: AppColors.primaryDark : isLight? AppColors.white : AppColors.scaffoldDark2,
                      text: local.english,
                      style: theme.textTheme.bodyMedium?.copyWith(color: isEnglish?
                      AppColors.white :
                      isLight? AppColors.primary : AppColors.white),),),

                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      //todo: change language
                      provider.changeLanguage("ar");
                    },
                    child: PrimeWidget(isEnglish: !isEnglish,
                      color: isEnglish? isLight? AppColors.white: AppColors.scaffoldDark2 : isLight? AppColors.primary : AppColors.primaryDark,
                      text: local.arabic,
                      style: theme.textTheme.bodyMedium?.copyWith(color:  isEnglish?
                      isLight ? AppColors.primary : AppColors.white
                          : AppColors.white),),),

                ],
              ),
              const SizedBox(height: 16,),
              Row(
                children: [
                  Text(local.theme,style: theme.textTheme.bodyLarge,),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      provider.changeTheme("light");
                    },
                    child: ThemeWidget(isLight: isLight,
                        color: isLight ? AppColors.primary : AppColors.scaffoldDark2,
                        widget: ImageIcon(AssetImage(AppAssets.icnSunLight),color: isLight? AppColors.white :AppColors.primaryDark)),
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.primary,
                  //       borderRadius: BorderRadius.circular(8)
                  //   ),
                  //   child: ImageIcon(AssetImage(AppAssets.icnSunLight,),color: AppColors.white,)
                  // ),
                  const SizedBox(width: 8,),
                  InkWell(
                    onTap: (){
                      provider.changeTheme("dark");
                    },
                    child: ThemeWidget(isLight: !isLight,
                        color: isLight ? AppColors.white : AppColors.primaryDark,
                        widget: ImageIcon(AssetImage(AppAssets.moon ),color:isLight? AppColors.primary :AppColors.white )),
                  ),

                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 16,vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: AppColors.white,
                  //       borderRadius: BorderRadius.circular(8)
                  //   ),
                  //   child: ImageIcon(AssetImage(AppAssets.icnMoonLight),)
                  // ),

                ],
              ),
              const SizedBox(height: 40,),

              SharedButton(text:local.letsStart,style: theme.textTheme.titleLarge,color: isLight? AppColors.primary : AppColors.primaryDark,onTap: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
              }, )
            ]
                ),
        ),
      )
    );
  }
}
