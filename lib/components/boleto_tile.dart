import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/insert_boleto/controller/insert_boleto_controller.dart';
import 'package:nlw_two/shared/models/boleto_model.dart';

class BoletoTileWidget extends StatefulWidget {
  final BoletoModel boletoModel;
  const BoletoTileWidget({
    Key? key,
    required this.boletoModel,
  }) : super(key: key);

  @override
  _BoletoTileWidgetState createState() => _BoletoTileWidgetState();
}

class _BoletoTileWidgetState extends State<BoletoTileWidget> {
  final controller = InsertBoletoController();

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          widget.boletoModel.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          "Vence em ${widget.boletoModel.dueDate!}",
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$ ",
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: "${widget.boletoModel.value!.toStringAsFixed(2)}",
                style: TextStyles.trailingBold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
