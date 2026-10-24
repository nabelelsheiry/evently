import 'package:evently/core/utils/app_assets.dart';
import 'package:evently/core/utils/app_colors.dart';
import 'package:evently/core/widgets/custom_outlined_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/login/login_screen.dart';
import 'package:evently/provider/app_language_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "Register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        await userCredential.user!
            .updateDisplayName(_nameController.text.trim());
      }

      if (!mounted) return;

      Fluttertoast.showToast(
        msg: "Account created successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16,
      );

      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e, stackTrace) {
      debugPrint('FirebaseAuthException code: ${e.code}');
      debugPrint('FirebaseAuthException message: ${e.message}');
      debugPrint('Stack trace: $stackTrace');

      String message = "Something went wrong, please try again later";

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'The email address is not valid.';
      } else if (e.code == 'operation-not-allowed') {
        message =
        'Email/Password sign-in is disabled in Firebase Console.';
      } else if (e.code == 'network-request-failed') {
        message = 'Network error. Please check your internet connection.';
      } else if (e.message != null && e.message!.isNotEmpty) {
        message = e.message!;
      }

      if (!mounted) return;

      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    } catch (e, stackTrace) {
      debugPrint('Unexpected registration error: $e');
      debugPrint('Stack trace: $stackTrace');

      if (!mounted) return;

      Fluttertoast.showToast(
        msg: 'Registration failed: $e',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // Future<void> _register() async {
  //   if (!_formKey.currentState!.validate()) {
  //     debugPrint('❌ FORM VALIDATION FAILED');
  //     return;
  //   }
  //
  //   setState(() {
  //     _isLoading = true;
  //   });
  //
  //   try {
  //     debugPrint('========== REGISTER STARTED ==========');
  //     debugPrint('Email: ${_emailController.text.trim()}');
  //     debugPrint('Creating Firebase user...');
  //
  //     final userCredential =
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _emailController.text.trim(),
  //       password: _passwordController.text,
  //     );
  //
  //     debugPrint('✅ USER CREATED SUCCESSFULLY');
  //     debugPrint('UID: ${userCredential.user?.uid}');
  //     debugPrint('Email: ${userCredential.user?.email}');
  //
  //     if (userCredential.user != null) {
  //       debugPrint('Updating display name...');
  //
  //       await userCredential.user!
  //           .updateDisplayName(_nameController.text.trim());
  //
  //       debugPrint('✅ DISPLAY NAME UPDATED');
  //     }
  //
  //     if (!mounted) return;
  //
  //     Fluttertoast.showToast(
  //       msg: 'Account created successfully!',
  //       backgroundColor: Colors.green,
  //       textColor: Colors.white,
  //     );
  //
  //     Navigator.pushReplacementNamed(
  //       context,
  //       HomeScreen.routeName,
  //     );
  //   } on FirebaseAuthException catch (e, stackTrace) {
  //     debugPrint('');
  //     debugPrint('========== FIREBASE AUTH ERROR ==========');
  //     debugPrint('Runtime type: ${e.runtimeType}');
  //     debugPrint('Error code: ${e.code}');
  //     debugPrint('Error message: ${e.message}');
  //     debugPrint('Plugin: ${e.plugin}');
  //     debugPrint('Exception: $e');
  //     debugPrint('Stack trace:\n$stackTrace');
  //     debugPrint('=========================================');
  //
  //     if (!mounted) return;
  //
  //     Fluttertoast.showToast(
  //       msg: '${e.code}: ${e.message}',
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //     );
  //   } catch (e, stackTrace) {
  //     debugPrint('');
  //     debugPrint('========== UNEXPECTED ERROR ==========');
  //     debugPrint('Runtime type: ${e.runtimeType}');
  //     debugPrint('Error: $e');
  //     debugPrint('Stack trace:\n$stackTrace');
  //     debugPrint('======================================');
  //
  //     if (!mounted) return;
  //
  //     Fluttertoast.showToast(
  //       msg: 'An unexpected error occurred. Check terminal logs.',
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       toastLength: Toast.LENGTH_LONG,
  //     );
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = Provider.of<AppLanguageProvider>(context);

    final bool isDark =
        provider.theme == "dark" || theme.brightness == Brightness.dark;

    final Color primaryColor =
    isDark ? AppColors.primaryDark : AppColors.primary;
    final Color textColor = isDark ? AppColors.white : AppColors.primary;

    return Scaffold(
      backgroundColor:
      isDark ? AppColors.scaffoldDark2 : AppColors.scaffold,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Hero(
                          tag: "hero",
                          child: Center(
                            child: Image.asset(
                              isDark
                                  ? AppAssets.eventlyLogoDark
                                  : AppAssets.eventlyLogo,
                              width: 180,
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          "Create your account",
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ) ??
                              TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                        ),
                        const SizedBox(height: 24),
                        CustomTextFormField(
                          obscureText: false,
                          controller: _nameController,
                          hintText: "Enter your name",
                          prefixIcon: Icons.person_outline,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          obscureText: false,
                          controller: _emailController,
                          hintText: "Enter your email",
                          prefixIcon: Icons.email_outlined,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }

                            final emailRegex = RegExp(
                              r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );

                            if (!emailRegex.hasMatch(value.trim())) {
                              return 'Please enter a valid email address';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: "Enter your password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: _isObscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscurePassword = !_isObscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your password';
                            }

                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          controller: _confirmPasswordController,
                          hintText: "Confirm your password",
                          prefixIcon: Icons.lock_outline,
                          obscureText: _isObscureConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscureConfirmPassword =
                                !_isObscureConfirmPassword;
                              });
                            },
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm your password';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _register,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(
                              color: AppColors.white,
                            )
                                : const Text(
                              "Sign up",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                color:
                                isDark ? AppColors.white : AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    LoginScreen.routeName,
                                  );
                                }
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.primary,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors.primary,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        CustomOutlinedButton(
                          onPressed: () {},
                          backgroundColor:
                          isDark ? Colors.transparent : AppColors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                AppAssets.googleLogo,
                                width: 24,
                                height: 24,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "Sign up with Google",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}