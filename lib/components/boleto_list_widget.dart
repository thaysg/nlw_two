import 'package:flutter/material.dart';
import 'package:nlw_two/shared/models/boleto_model.dart';

import '../screens/meus_boletos_screen.dart/controller/boleto_list_controller.dart';
import 'boleto_tile.dart';

class BoletoListWidget extends StatefulWidget {
  final BoletoListController controller;

  const BoletoListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _BoletoListWidgetState createState() => _BoletoListWidgetState();
}

class _BoletoListWidgetState extends State<BoletoListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<BoletoModel>>(
      valueListenable: widget.controller.boletosNotifier,
      builder: (_, boletos, __) => Column(
        children: boletos
            .map((e) => BoletoTileWidget(
                  boletoModel: e,
                ))
            .toList(),
      ),
    );
  }
}
