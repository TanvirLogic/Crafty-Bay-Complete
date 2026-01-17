import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: false,
            height: 200.0,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _selectedIndex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: .center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),

        ValueListenableBuilder(
          valueListenable: _selectedIndex,
          builder: (context,selectedIndex,_) {
            return Row(
              mainAxisAlignment: .center,
              spacing: 4,
              children: [
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: .circular(12),
                      border: Border.all(color: Colors.grey),
                      color: i == selectedIndex
                          ? AppColors.themeColor
                          : null,
                    ),
                  ),
              ],
            );
          }
        ),
      ],
    );
  }
}
