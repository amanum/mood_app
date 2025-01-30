import 'package:bloc/bloc.dart';
import 'package:evo_est/data/entity/feeling.dart';
import 'package:evo_est/data/entity/mood.dart';
import 'package:evo_est/data/repository/mood_repository.dart';
import 'package:meta/meta.dart';

part 'mood_diary_event.dart';

part 'mood_diary_state.dart';

class MoodDiaryBloc extends Bloc<MoodDiaryEvent, MoodDiaryState> {
  MoodDiaryBloc({
    required MoodRepository moodRepository,
  })  : _moodRepository = moodRepository,
        super(MoodDiaryStateLoading()) {
    on<MoodDiaryEvent>((event, emitter) => switch (event) {
          MoodDiaryEventGetMoodList _ => _onGetMoodList(event, emitter),
          MoodDiaryEventSelectMood _ => _onSelectMood(event, emitter),
          MoodDiaryEventSelectFeeling _ => _onSelectFeeling(event, emitter),
        });
  }

  final MoodRepository _moodRepository;

  Future<void> _onGetMoodList(
    MoodDiaryEventGetMoodList event,
    Emitter<MoodDiaryState> emitter,
  ) async {
    final moodList = await _moodRepository.getMoodList();
    emitter(MoodDiaryStateActive(moodList: moodList));
  }

  Future<void> _onSelectMood(
    MoodDiaryEventSelectMood event,
    Emitter<MoodDiaryState> emitter,
  ) async {
    if (this.state is! MoodDiaryStateActive) {
      return;
    }
    final state = this.state as MoodDiaryStateActive;
    final feelingList = await _moodRepository.getFeelingsByMoodId(event.moodId);
    emitter(MoodDiaryStateActive(
      moodList: state.moodList,
      feelingList: feelingList,
      selectedMoodId: event.moodId,
    ));
  }

  Future<void> _onSelectFeeling(
    MoodDiaryEventSelectFeeling event,
    Emitter<MoodDiaryState> emitter,
  ) async {
    if (this.state is! MoodDiaryStateActive) {
      return;
    }
    final state = this.state as MoodDiaryStateActive;
    final selectedFeelings = [...state.selectedFeelingList];
    if (selectedFeelings.contains(event.feelingId)) {
      selectedFeelings.remove(event.feelingId);
    } else {
      selectedFeelings.add(event.feelingId);
    }
    emitter(MoodDiaryStateActive(
      moodList: state.moodList,
      feelingList: state.feelingList,
      selectedMoodId: state.selectedMoodId,
      selectedFeelingList: selectedFeelings,
    ));
  }
}
