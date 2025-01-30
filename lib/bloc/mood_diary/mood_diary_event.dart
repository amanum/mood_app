part of 'mood_diary_bloc.dart';

@immutable
sealed class MoodDiaryEvent {}

class MoodDiaryEventGetMoodList extends MoodDiaryEvent {}

class MoodDiaryEventSelectMood extends MoodDiaryEvent {
  MoodDiaryEventSelectMood({required this.moodId});

  final int moodId;
}

class MoodDiaryEventSelectFeeling extends MoodDiaryEvent {
  MoodDiaryEventSelectFeeling({required this.feelingId});

  final int feelingId;
}
