library border_bottom_navigation_bar;

import 'package:flutter/material.dart';

class BorderBottomNavigationBar extends StatelessWidget {
  final double height;
  final double borderRadiusValue;
  final List<BorderBottomNavigationItems> customBottomNavItems;

  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final bool hideLabel;
  final String? label;
  final double selectedLabelFontSize;
  final double unselectedLabelFontSize;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final int currentIndex;
  final Function(int) onTap;

  const BorderBottomNavigationBar({
    Key? key,
    this.height = 55,
    this.borderRadiusValue = 25,
    required this.customBottomNavItems,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    required this.selectedIconColor,
    required this.unselectedIconColor,
    this.hideLabel = true,
    this.currentIndex = 0,
    this.unselectedLabelFontSize = 12,
    this.selectedLabelFontSize = 14,
    this.selectedLabelColor = Colors.black,
    this.unselectedLabelColor = Colors.black,
    required this.onTap,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Container(
          height: height,
          margin: const EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(customBottomNavItems.length, (index) {
              return Expanded(
                child: BorderBottomNavigationButton(
                  onTap: onTap,
                  unselectedIconColor: unselectedIconColor,
                  selectedIconColor: selectedIconColor,
                  selectedLabelColor: selectedLabelColor,
                  unselectedLabelColor: unselectedLabelColor,
                  unselectedBackgroundColor: unselectedBackgroundColor,
                  selectedBackgroundColor: selectedBackgroundColor,
                  icon: customBottomNavItems[index].icon,
                  // label: customBottomNavItems[index].label,
                  hideLabel: hideLabel,
                  index: index,
                  currentIndex: currentIndex,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class BorderBottomNavigationItems {
  final IconData icon;
  // final String label;

  BorderBottomNavigationItems({
    required this.icon,
    // required this.label,
  });
}

class BorderBottomNavigationButton extends StatelessWidget {
  final IconData icon;
  final Color selectedBackgroundColor;
  final Color unselectedBackgroundColor;
  final bool hideLabel;
  final String? label;
  final double selectedLabelFontSize;
  final double unselectedLabelFontSize;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Function(int) onTap;
  final int? currentIndex;
  final int index;

  const BorderBottomNavigationButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.currentIndex,
    required this.selectedBackgroundColor,
    required this.unselectedBackgroundColor,
    this.hideLabel = true,
    this.unselectedLabelFontSize = 12,
    this.selectedLabelFontSize = 14,
    this.selectedLabelColor = Colors.black,
    this.unselectedLabelColor = Colors.black,
    required this.index,
    this.label,
    required this.selectedIconColor,
    required this.unselectedIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: currentIndex == index
          ? selectedBackgroundColor
          : unselectedBackgroundColor,
      margin: const EdgeInsets.only(right: 0.2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: hideLabel
                ? Icon(
                    icon,
                    color: currentIndex == index
                        ? selectedIconColor
                        : unselectedIconColor,
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Icon(
                          icon,
                          color: currentIndex == index
                              ? selectedIconColor
                              : unselectedIconColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          label!,
                          style: TextStyle(
                            color: currentIndex == index
                                ? selectedLabelColor
                                : unselectedLabelColor,
                            fontSize: currentIndex == index
                                ? selectedLabelFontSize
                                : unselectedLabelFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  onTap(index);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
