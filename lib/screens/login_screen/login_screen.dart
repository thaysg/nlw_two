import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/app_images.dart';
import 'package:nlw_two/components/social_button.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/login_screen/controller/login_controller.dart';

class LoginScreem extends StatefulWidget {
  const LoginScreem({Key? key}) : super(key: key);

  @override
  _LoginScreemState createState() => _LoginScreemState();
}

class _LoginScreemState extends State<LoginScreem> {
  final controller = LoginController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              width: size.width,
              height: size.height * 0.36,
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 40,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 300,
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: size.height * 0.15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 70, right: 70),
                    child: Text(
                      "Organize seus boletos em um só lugar",
                      textAlign: TextAlign.center,
                      style: TextStyles.titleHome,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      left: 40,
                      right: 40,
                    ),
                    child: SocialButton(
                      onTap: () {
                        controller.googleSignIn(context);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
