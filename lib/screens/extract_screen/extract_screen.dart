import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/boleto_info_widget.dart';
import 'package:nlw_two/components/boleto_list_widget.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/meus_boletos_screen.dart/controller/boleto_list_controller.dart';
import 'package:nlw_two/shared/models/boleto_model.dart';

class ExtracPage extends StatefulWidget {
  const ExtracPage({Key? key}) : super(key: key);

  @override
  _ExtracPageState createState() => _ExtracPageState();
}

class _ExtracPageState extends State<ExtracPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 40,
              color: AppColors.primary,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) =>
                    BoletoInfoWidget(size: boletos.length),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Meus Extratos",
              style: TextStyles.titleBoldHeading,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Divider(
            color: AppColors.stroke,
            height: 0,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BoletoListWidget(
            controller: controller,
          ),
        ),
      ],
    );
  }
}
