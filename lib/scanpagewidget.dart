import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'resultpagewidget.dart';
import 'switch_bar.dart';

class ScanPageWidget extends StatefulWidget {
  @override
  _ScanPageWidgetState createState() => _ScanPageWidgetState();
}

class _ScanPageWidgetState extends State<ScanPageWidget> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true, // Show flash icon
        ScanMode.BARCODE,
      );

      if (barcode != '-1') {
        await _fetchBarcodeResult(barcode);
      }
    } catch (e) {
      _showError('Scan failed: $e');
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        await _scanBarcodeFromImage(imageFile);
      }
    } catch (e) {
      _showError('Image selection failed: $e');
    }
  }

  Future<void> _scanBarcodeFromImage(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final barcodeScanner = BarcodeScanner();
      final List<Barcode> barcodes =
          await barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        final String? barcode = barcodes.first.rawValue;
        if (barcode != null) {
          await _fetchBarcodeResult(barcode);
        } else {
          _showError('No barcode found');
        }
      } else {
        _showError('No barcode found');
      }
    } catch (e) {
      _showError('Barcode scan failed: $e');
    }
  }

  Future<void> _fetchBarcodeResult(String barcode) async {
    final response =
        await http.get(Uri.parse('http://192.168.1.4:3000/product/$barcode'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _navigateToResultPage(data['result']);
    } else {
      _showError('Error fetching result');
    }
  }

  Future<void> _checkMaterials() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        final File imageFile = File(pickedFile.path);
        await _recognizeTextFromImage(imageFile);
      }
    } catch (e) {
      _showError('Image capture failed: $e');
    }
  }

  Future<void> _recognizeTextFromImage(File imageFile) async {
    try {
      final inputImage = InputImage.fromFile(imageFile);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      final List<String> materialNames = _extractMaterialNames(recognizedText);
      if (materialNames.isNotEmpty) {
        await _fetchMaterialResults(materialNames);
      } else {
        _showError('No material text found');
      }
    } catch (e) {
      _showError('Text recognition failed: $e');
    }
  }

  List<String> _extractMaterialNames(RecognizedText recognizedText) {
    final Set<String> materialNames = {};
    final textLines = recognizedText.text.split('\n');
    for (var line in textLines) {
      final words = line.split(' ');
      for (var word in words) {
        materialNames.add(word.trim().toLowerCase());
      }
    }
    return materialNames.toList();
  }

  Future<void> _fetchMaterialResults(List<String> materialNames) async {
    final namesQuery = materialNames.join(',');
    final url = 'http://192.168.1.4:3000/material?names=$namesQuery';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is Map) {
        final results = data.values.join(', ');
        _navigateToResultPage(
            results.isNotEmpty ? results : 'No materials found');
      } else {
        _showError('Error fetching material results');
      }
    } else {
      _showError('Error fetching material results');
    }
  }

  void _navigateToResultPage(String result) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPageWidget(result: result),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Background_black.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: width,
                height: height * 0.338,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.076,
              left: width * 0.091,
              child: Container(
                width: width * 0.061,
                height: width * 0.061,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Arrow.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.362,
              left: width * 0.132,
              child: Container(
                width: width * 0.735,
                height: height * 0.277,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: height * 0.108,
                      left: width * 0.099,
                      child: GestureDetector(
                        onTap: _scanBarcode,
                        child: Container(
                          width: width * 0.573,
                          height: height * 0.067,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(255, 255, 255, 0.74),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Scan Barcode with Camera',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.207,
                      left: width * 0.209,
                      child: GestureDetector(
                        onTap: _checkMaterials,
                        child: Container(
                          width: width * 0.367,
                          height: height * 0.067,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(255, 255, 255, 0.74),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Check Materials',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          width: width * 0.735,
                          height: height * 0.067,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 1),
                                Color.fromRGBO(255, 255, 255, 0.74),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Pick Image from Gallery for Barcode',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Add the SwitchBar widget here
            Positioned(
              bottom: 0,
              left: 0,
              child: SwitchBar(
                screenWidth: width,
                screenHeight: height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
