import 'package:flutter/material.dart';

class GramMeter extends StatefulWidget {
  const GramMeter({Key? key}) : super(key: key);

  @override
  State<GramMeter> createState() => _GramMeterState();
}

class _GramMeterState extends State<GramMeter> {
  double _currentSliderValue = 2;
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 30,
      divisions: 6,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderValue = value;
        });
      },
    );
  }
}
