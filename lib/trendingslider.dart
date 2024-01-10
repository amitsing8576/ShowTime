import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:showtime/constant.dart';
import 'package:showtime/details_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: snapshot.data!.length,
          options: CarouselOptions(
            height: 280,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            print(
                '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}');

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: snapshot.data[itemIndex],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 280,
                  width: 200,
                  child: Image.network(
                    '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
