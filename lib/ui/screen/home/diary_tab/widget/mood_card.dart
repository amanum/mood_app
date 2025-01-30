import 'package:evo_est/bloc/mood_diary/mood_diary_bloc.dart';
import 'package:evo_est/data/entity/mood.dart';
import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    required this.mood,
    required this.isActive,
    super.key,
  });

  final Mood mood;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GestureDetector(
        onTap: () {
          context
              .read<MoodDiaryBloc>()
              .add(MoodDiaryEventSelectMood(moodId: mood.id));
        },
        child: Container(
          width: 83,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(76),
            color: Colors.white,
            border: Border.all(
              color: isActive
                  ? EvoColors.orange
                  : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFB6A1C0).withAlpha((255 * 0.11).round()),
                blurRadius: 10,
                offset: Offset(2, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(vertical: 23),
          child: Column(
            children: [
              Image.asset(mood.emojiAsset),
              Text(
                mood.name,
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF4C4C69),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
