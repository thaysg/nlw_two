import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/app_images.dart';
import 'package:nlw_two/shared/auth/auth_controller.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = AuthController();
    authController.currentUser(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset(AppImages.union)),
          Center(child: Image.asset(AppImages.logoFull)),
        ],
      ),
    );
  }
}
