import 'package:evo_est/ui/style/evo_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EvoTabBar extends StatelessWidget {
  const EvoTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.red,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      labelPadding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 17,
      ),
      padding: EdgeInsets.zero,
      unselectedLabelColor: EvoColors.grey,
      indicator: BoxDecoration(
        color: EvoColors.orange,
        borderRadius: BorderRadius.circular(100),
      ),
      dividerHeight: 0,
      splashBorderRadius: BorderRadius.circular(100),
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      tabs: [
        IntrinsicWidth(
          child: _TabBarItem(
            isActive: tabController.index == 0,
            title: 'Дневник настроения',
            iconAsset: 'assets/icons/diary.svg',
          ),
        ),
        IntrinsicWidth(
          child: _TabBarItem(
            isActive: tabController.index == 1,
            title: 'Статистика',
            iconAsset: 'assets/icons/statistics.svg',
          ),
        ),
      ],
    );
  }
}

class _TabBarItem extends StatelessWidget {
  const _TabBarItem({
    required this.isActive,
    required this.title,
    required this.iconAsset,
    super.key,
  });

  final bool isActive;
  final String title;
  final String iconAsset;

  @override
  Widget build(BuildContext context) {
    final Color currentColor =
        DefaultTextStyle.of(context).style.color ?? EvoColors.orange;
    return Row(
      spacing: 6,
      children: [
        SvgPicture.asset(
          iconAsset,
          colorFilter: ColorFilter.mode(
            currentColor,
            BlendMode.srcIn,
          ),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
