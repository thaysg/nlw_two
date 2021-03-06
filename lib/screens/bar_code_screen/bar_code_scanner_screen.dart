import 'package:flutter/material.dart';
import 'package:nlw_two/components/app_colors.dart';
import 'package:nlw_two/components/bottom_Sheet_widget.dart';
import 'package:nlw_two/components/set_label_buttons.dart';
import 'package:nlw_two/components/text_style.dart';
import 'package:nlw_two/screens/bar_code_screen/bar_code_scanner_status.dart';
import 'package:nlw_two/screens/bar_code_screen/controller/barcode_controller.dart';

class BarCodeScaneerScreen extends StatefulWidget {
  const BarCodeScaneerScreen({Key? key}) : super(key: key);

  @override
  _BarCodeScaneerScreenState createState() => _BarCodeScaneerScreenState();
}

class _BarCodeScaneerScreenState extends State<BarCodeScaneerScreen> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(
          context,
          "/insert_boleto",
          arguments: controller.status.barcode,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.7))),
                  Expanded(
                      flex: 2, child: Container(color: Colors.transparent)),
                  Expanded(
                      child: Container(color: Colors.black.withOpacity(0.7))),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                primaryLabel: "Inserir código do boleto",
                primaryOnTap: () {
                  Navigator.pushReplacementNamed(context, "/insert_boleto");
                },
                secondaryLabel: "Adicionar da galeria",
                secondartyOnTap: controller.scanWithImagePicker,
              ),
            ),
          ),
          ValueListenableBuilder<BarCodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  primaryLabel: "Escanear novamente",
                  secondaryLabel: "Digitar código",
                  primaryOnTap: () {
                    controller.getAvailableCameras();
                  },
                  secondartyOnTap: () {
                    Navigator.pushReplacementNamed(context, "/insert_boleto");
                  },
                  title: "Não foi possível identificar um código de barras",
                  subtitle:
                      "Tente escanear novamente ou digite o código do seu boleto.",
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
