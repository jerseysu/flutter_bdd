// ignore: avoid_relative_lib_imports
import 'package:flutter_bdd/main.dart' as flutter_bdd;
import 'package:flutter_driver/driver_extension.dart';
import 'dart:developer';
import 'package:test/test.dart';

void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  flutter_bdd.main();

  test('Test - Main function return Normally', () {
    expect(() => flutter_bdd.main(), returnsNormally);
  });
}
