import 'package:evo_est/data/entity/feeling.dart';
import 'package:evo_est/data/entity/mood.dart';

class MoodRepository {
  Future<List<Mood>> getMoodList() async {
    return _moodList;
  }

  Future<List<Feeling>> getFeelingsByMoodId(int moodId) async {
    return _feelingList.where((f) => f.moodId == moodId).toList();
  }
}

const List<Mood> _moodList = [
  Mood(
    id: 1,
    name: 'Радость',
    emojiAsset: 'assets/images/mood_happy.png',
  ),
  Mood(
    id: 2,
    name: 'Страх',
    emojiAsset: 'assets/images/mood_fear.png',
  ),
  Mood(
    id: 3,
    name: 'Бешенство',
    emojiAsset: 'assets/images/mood_angry.png',
  ),
  Mood(
    id: 4,
    name: 'Грусть',
    emojiAsset: 'assets/images/mood_sad.png',
  ),
  Mood(
    id: 5,
    name: 'Спокойствие',
    emojiAsset: 'assets/images/mood_calm.png',
  ),
  Mood(
    id: 6,
    name: 'Сила',
    emojiAsset: 'assets/images/mood_strength.png',
  ),
];

const List<Feeling> _feelingList = [
  Feeling(
    id: 1,
    moodId: 1,
    name: 'Возбуждение',
  ),
  Feeling(
    id: 2,
    moodId: 1,
    name: 'Восторг',
  ),
  Feeling(
    id: 3,
    moodId: 1,
    name: 'Игривость',
  ),
  Feeling(
    id: 4,
    moodId: 1,
    name: 'Наслаждение',
  ),
  Feeling(
    id: 5,
    moodId: 1,
    name: 'Очарование',
  ),
  Feeling(
    id: 6,
    moodId: 1,
    name: 'Осознанность',
  ),
  Feeling(
    id: 7,
    moodId: 1,
    name: 'Смелость',
  ),
  Feeling(
    id: 8,
    moodId: 1,
    name: 'Удовольствие',
  ),
  Feeling(
    id: 9,
    moodId: 1,
    name: 'Чувственность',
  ),
  Feeling(
    id: 10,
    moodId: 1,
    name: 'Энергичность',
  ),
  Feeling(
    id: 11,
    moodId: 1,
    name: 'Экстравагантность',
  ),
  Feeling(
    id: 12,
    moodId: 2,
    name: 'Страх 1',
  ),
  Feeling(
    id: 13,
    moodId: 2,
    name: 'Страх 2',
  ),
  Feeling(
    id: 14,
    moodId: 3,
    name: 'Бешенство 1',
  ),
  Feeling(
    id: 15,
    moodId: 3,
    name: 'Бешенство 2',
  ),
  Feeling(
    id: 16,
    moodId: 4,
    name: "Грусть 1",
  ),
  Feeling(
    id: 17,
    moodId: 4,
    name: "Грусть 2",
  ),
  Feeling(
    id: 18,
    moodId: 5,
    name: "Спокойствие 1",
  ),
  Feeling(
    id: 19,
    moodId: 5,
    name: "Спокойствие 2",
  ),
  Feeling(
    id: 20,
    moodId: 6,
    name: "Сила 1",
  ),
  Feeling(
    id: 21,
    moodId: 6,
    name: "Сила 2",
  ),
];
