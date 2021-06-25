import 'package:flutter/material.dart';
import 'package:nlw_two/components/text_style.dart';

import 'app_colors.dart';
import 'app_images.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;
  const BoletoInfoWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              AppImages.logomini,
              color: AppColors.white,
              width: 56,
              height: 34,
            ),
            Container(
              width: 1,
              height: 32,
              color: AppColors.white,
            ),
            Text.rich(
              TextSpan(
                text: "Você tem ",
                style: TextStyles.textAnimationCard,
                children: [
                  TextSpan(
                    text: "$size boletos",
                    style: TextStyles.textAnimationCard,
                  ),
                  TextSpan(
                    text: "\ncadastrados pra pagar",
                    style: TextStyles.textAnimationCard,
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
