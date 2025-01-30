import 'package:evo_est/bloc/mood_diary/mood_diary_bloc.dart';
import 'package:evo_est/data/repository/mood_repository.dart';
import 'package:evo_est/ui/screen/home/diary_tab/diary_tab.dart';
import 'package:evo_est/ui/screen/home/widget/evo_tab_bar.dart';
import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoodDiaryBloc(moodRepository: MoodRepository())
        ..add(MoodDiaryEventGetMoodList()),
      child: Scaffold(
        backgroundColor: Color(0xFFFFFDFC),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            DateFormat("d MMMM HH:mm", 'ru').format(DateTime.now()),
            style: TextStyle(
              color: EvoColors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/calendar.svg',
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color(0xFFF2F2F2),
                ),
                child: EvoTabBar(tabController: _tabController),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 12),
                    child: DiaryTab(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 12),
                    child: Center(
                      child: Text('Some statistics'),
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
