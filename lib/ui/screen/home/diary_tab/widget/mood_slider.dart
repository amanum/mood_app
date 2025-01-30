import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MoodSlider extends StatelessWidget {
  const MoodSlider({
    required this.val,
    required this.onChanged,
    required this.minLabel,
    required this.maxLabel,
    required this.disabled,
    super.key,
  });

  final double val;
  final Function(double) onChanged;
  final String minLabel;
  final String maxLabel;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(ignoring: disabled,
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6A1C0).withAlpha((255 * 0.11).round()),
              blurRadius: 10,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            SfSliderTheme(
              data: SfSliderThemeData(
                tickOffset: Offset(0.0, -22),
                inactiveTrackHeight: 6,
                tickSize: Size(2, 8),
                activeTickColor: EvoColors.grey2,
                inactiveTickColor: EvoColors.grey2,
                overlayColor: Colors.transparent,
                activeDividerColor: Colors.transparent,
                thumbStrokeWidth: 4,
                thumbStrokeColor: Colors.white,
                thumbRadius: 9,
                overlayRadius: 0,
              ),
              child: SfSlider(
                value: val,
                max: 10,
                stepSize: 1,
                showTicks: true,
                interval: 2,
                activeColor: disabled ? EvoColors.grey2 : EvoColors.orange,
                inactiveColor: EvoColors.grey2,
                onChanged: (val) => onChanged(val),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    minLabel,
                    style: TextStyle(
                      color: Color(0xFF919EAB),
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    maxLabel,
                    style: TextStyle(
                      color: Color(0xFF919EAB),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
