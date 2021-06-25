import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/text_style.dart';

import 'divider_vertical.dart';
import 'label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;
  final VoidCallback primaryOnTap;
  final VoidCallback secondartyOnTap;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnTap,
    required this.secondartyOnTap,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: primaryLabel,
                    onTap: primaryOnTap,
                    style: enablePrimaryColor
                        ? TextStyles.buttonBoldPrimary
                        : null,
                  ),
                ),
                DividerVerticalWidget(),
                Expanded(
                  child: LabelButton(
                    label: secondaryLabel,
                    style: enableSecondaryColor
                        ? TextStyles.buttonBoldPrimary
                        : null,
                    onTap: secondartyOnTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
