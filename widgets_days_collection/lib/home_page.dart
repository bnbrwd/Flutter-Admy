import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //RatingBar Widget
            const Text('Rating Bar', style: TextStyle(fontSize: 18)),
            RatingBar(
              minRating: 1,
              maxRating: 5,
              initialRating: 3,
              // allowHalfRating: true,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                half: const Icon(Icons.star_half_sharp),
                empty: const Icon(
                  Icons.star,
                  color: Colors.grey,
                ),
              ),
              onRatingUpdate: _saveRating,
            ),
            const SizedBox(height: 20),
            const Text('Linear gradients', style: TextStyle(fontSize: 18)),
            //Linear gradients
            Container(
              height: 100,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff027DFD),
                      Color(0xff4100E0),
                      Color(0xffF2DD22),
                    ],
                    // stops: [0.10, 0.20, 0.50, 0.75],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    transform: GradientRotation(3.14 / 4)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Shader Mask', style: TextStyle(fontSize: 18)),
            //Shader Mask
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                    Color(0xff027DFD),
                    Color(0xff4100E0),
                    Color(0xffF2DD22),
                  ],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      transform: GradientRotation(3.14 / 4))
                  .createShader(bounds),
              child: const Text(
                'Hello Flutter World',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Action Button', style: TextStyle(fontSize: 18)),
            FocusableActionDetector(
                child: OutlinedButton(
              onPressed: () {},
              child: Text('Submit Button'),
            )),
            const SizedBox(height: 20),
            const Text('Badge ', style: TextStyle(fontSize: 18)),
            Badge(
                badgeContent: Text('9', style: TextStyle(fontSize: 18)),
                badgeColor: Colors.greenAccent,
                position: BadgePosition.topStart(),
                animationType: BadgeAnimationType.fade,
                child: Icon(Icons.access_time, size: 60))
                //20
          ],
        ),
      ),
    );
  }

  void _saveRating(double value) {
    print(value);
  }
}
