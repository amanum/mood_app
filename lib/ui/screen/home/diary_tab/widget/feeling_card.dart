import 'package:evo_est/bloc/mood_diary/mood_diary_bloc.dart';
import 'package:evo_est/data/entity/feeling.dart';
import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeelingCard extends StatelessWidget {
  const FeelingCard({
    required this.feeling,
    required this.isActive,
    super.key,
  });

  final Feeling feeling;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<MoodDiaryBloc>()
            .add(MoodDiaryEventSelectFeeling(feelingId: feeling.id));
      },
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? EvoColors.orange : Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB6A1C0).withAlpha((255 * 0.11).round()),
              blurRadius: 10,
              offset: Offset(2, 4),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          feeling.name,
          style: TextStyle(
            fontSize: 11,
            color: isActive ? Colors.white : Color(0xFF4C4C69),
          ),
        ),
      ),
    );
  }
}
