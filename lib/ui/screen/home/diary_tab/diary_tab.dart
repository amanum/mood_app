import 'package:evo_est/bloc/mood_diary/mood_diary_bloc.dart';
import 'package:evo_est/ui/screen/home/diary_tab/widget/feeling_card.dart';
import 'package:evo_est/ui/screen/home/diary_tab/widget/mood_card.dart';
import 'package:evo_est/ui/screen/home/diary_tab/widget/mood_slider.dart';
import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiaryTab extends StatefulWidget {
  const DiaryTab({super.key});

  @override
  State<DiaryTab> createState() => _DiaryTabState();
}

class _DiaryTabState extends State<DiaryTab> {
  double _stressValue = 5;
  double _selfRespectValue = 5;
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
      builder: (context, state) {
        switch (state) {
          case MoodDiaryStateLoading():
            return Center(child: CircularProgressIndicator());
          case MoodDiaryStateActive():
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle('Что чувствуешь?'),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.moodList.length,
                      itemBuilder: (context, index) {
                        final mood = state.moodList[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 20 : 0,
                            right: index == state.moodList.length - 1 ? 20 : 12,
                          ),
                          child: MoodCard(
                            mood: mood,
                            isActive: mood.id == state.selectedMoodId,
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(width: 12),
                    ),
                  ),
                  if (state.feelingList.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 36),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final feeling in state.feelingList)
                            FeelingCard(
                              feeling: feeling,
                              isActive: state.selectedFeelingList
                                  .contains(feeling.id),
                            ),
                        ],
                      ),
                    ),
                  _SectionTitle('Уровень стресса'),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MoodSlider(
                      val: _stressValue,
                      onChanged: (value) {
                        setState(() {
                          _stressValue = value;
                        });
                      },
                      minLabel: 'Низкий',
                      maxLabel: 'Высокий',
                      disabled: state.selectedMoodId == null,
                    ),
                  ),
                  SizedBox(height: 36),
                  _SectionTitle('Самооценка'),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: MoodSlider(
                      val: _selfRespectValue,
                      onChanged: (value) {
                        setState(() {
                          _selfRespectValue = value;
                        });
                      },
                      minLabel: 'Неуверенность',
                      maxLabel: 'Уверенность',
                      disabled: state.selectedMoodId == null,
                    ),
                  ),
                  SizedBox(height: 36),
                  _SectionTitle('Заметки'),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFFB6A1C0)
                                .withAlpha((255 * 0.11).round()),
                            blurRadius: 10,
                            offset: Offset(2, 4),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _noteController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Введите заметку',
                          hintStyle: TextStyle(
                            color: EvoColors.grey,
                          ),
                        ),
                        style: TextStyle(
                          color: Color(0xFF4C4C69),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: _noteController,
                        builder: (context, controller, _) {
                          bool isSubmitBtnDisabled = controller.text.isEmpty ||
                              state.selectedFeelingList.isEmpty;
                          return TextButton(
                            onPressed: isSubmitBtnDisabled ? null : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('DONE!'),
                                  duration: Duration(seconds: 2), // Время отображения
                                ),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith((states) {
                                if (states.contains(WidgetState.disabled)) {
                                  return Color(0xFFF2F2F2);
                                }
                                return EvoColors.orange;
                              }),
                            ),
                            child: Text(
                              'Сохранить',
                              style: TextStyle(
                                fontSize: 20,
                                color: isSubmitBtnDisabled
                                    ? EvoColors.grey
                                    : Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      },
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Color(0xFF4C4C69),
        ),
      ),
    );
  }
}
