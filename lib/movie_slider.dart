import 'package:flutter/material.dart';
import 'package:showtime/constant.dart';
import 'package:showtime/details_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      movie: snapshot.data[item],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      child: Image.network(
                        '${Constants.imagePath}${snapshot.data?[item]?.posterPath ?? ''}',
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
