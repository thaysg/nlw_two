import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/app_images.dart';
import 'package:nlw_two/components/text_style.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.stroke,
            ),
          ),
        ),
        height: 56,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 56,
                    width: 2,
                    decoration: BoxDecoration(
                      color: AppColors.stroke,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Entrar com o Google',
                style: TextStyles.buttonGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
