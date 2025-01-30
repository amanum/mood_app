part of 'mood_diary_bloc.dart';

@immutable
sealed class MoodDiaryState {}

final class MoodDiaryStateLoading extends MoodDiaryState {}

final class MoodDiaryStateActive extends MoodDiaryState {
  MoodDiaryStateActive({
    this.moodList = const [],
    this.feelingList = const [],
    this.selectedMoodId,
    this.selectedFeelingList = const [],
  });

  final List<Mood> moodList;
  final List<Feeling> feelingList;
  final int? selectedMoodId;
  final List<int> selectedFeelingList;
}
