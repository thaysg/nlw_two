import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondartyOnTap;
  final String title;
  final String subtitle;
  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnTap,
    required this.secondartyOnTap,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          children: [
                            TextSpan(text: "\n$subtitle"),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnTap: primaryOnTap,
                      secondaryLabel: secondaryLabel,
                      secondartyOnTap: secondartyOnTap,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
