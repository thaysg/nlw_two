class BarCodeScannerStatus {
  final bool isAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  /*  CameraController? cameraController; */

  BarCodeScannerStatus({
    this.isAvailable = false,
    this.error = "",
    this.stopScanner = false,
    this.barcode = "",
  });

  factory BarCodeScannerStatus.available() =>
      BarCodeScannerStatus(isAvailable: true, stopScanner: false);

  factory BarCodeScannerStatus.error(String message) =>
      BarCodeScannerStatus(error: message, stopScanner: true);

  factory BarCodeScannerStatus.barcode(String barcode) =>
      BarCodeScannerStatus(barcode: barcode, stopScanner: true);

  bool get showCamera => isAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
