import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/intput_text_widget.dart';
import 'package:nlw_two/components/set_label_buttons.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/insert_boleto/controller/insert_boleto_controller.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;
  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 93, vertical: 24),
                  child: Text(
                    "Preencha os dados do boleto",
                    textAlign: TextAlign.center,
                    style: TextStyles.titleBoldHeading,
                  ),
                ),
                InputTextWidget(
                  icon: Icons.description_outlined,
                  label: "Nome do boleto",
                  validator: controller.validateName,
                  onChanged: (value) {
                    controller.onChange(name: value);
                  },
                ),
                InputTextWidget(
                  controller: dueDateInputTextController,
                  icon: FontAwesomeIcons.timesCircle,
                  label: "Vencimento",
                  validator: controller.validateVencimento,
                  onChanged: (value) {
                    controller.onChange(dueDate: value);
                  },
                  keyboardType: TextInputType.datetime,
                ),
                InputTextWidget(
                  controller: moneyInputTextController,
                  icon: FontAwesomeIcons.wallet,
                  label: "Valor",
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    controller.onChange(
                        value: moneyInputTextController.numberValue);
                  },
                  validator: (_) => controller
                      .validateValor(moneyInputTextController.numberValue),
                ),
                InputTextWidget(
                  controller: barcodeInputTextController,
                  icon: FontAwesomeIcons.barcode,
                  label: "Código",
                  validator: controller.validateCodigo,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    controller.onChange(barcode: value);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        primaryLabel: "Cancelar",
        primaryOnTap: () {
          if (Navigator.canPop(context)) Navigator.pop(context);
        },
        secondaryLabel: "Cadastrar",
        secondartyOnTap: () async {
          await controller.cadastrarBoleto().then((value) =>
              {if (Navigator.canPop(context)) Navigator.pop(context)});
        },
        enableSecondaryColor: true,
      ),
    );
  }
}
