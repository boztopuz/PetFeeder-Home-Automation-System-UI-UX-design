import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeMeter extends StatefulWidget {
  const GaugeMeter({
    Key? key,
  }) : super(key: key);

  @override
  State<GaugeMeter> createState() => _GaugeMeterState();
}

class _GaugeMeterState extends State<GaugeMeter> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 320,
        child: SfRadialGauge(
          enableLoadingAnimation: true,
          animationDuration: 2000,
          title: const GaugeTitle(
              text: 'Completed Meal Counter',
              textStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 4,
              pointers: const [
                NeedlePointer(
                  value: 3,
                  enableAnimation: true,
                ),
              ],
              ranges: [
                GaugeRange(
                  startValue: 0,
                  endValue: 1,
                  color: Colors.red,
                ),
                GaugeRange(
                  startValue: 1,
                  endValue: 2,
                  color: Colors.orange,
                ),
                GaugeRange(
                  startValue: 2,
                  endValue: 3,
                  color: Colors.green,
                ),
                GaugeRange(
                  startValue: 3,
                  endValue: 4,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
