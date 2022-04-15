import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/banner.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nyumba',
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      ' FIND YOUR DREAM HOME TODAY.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0XFF57D665),
                strokeWidth: 8,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: const [
                Text(
                  'The easiest way\nto find Houses',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60,
                  ),
                ),
                Text(
                  'Search and inquire for your dream house\nView the house with the owner\nSecure the house by making payments.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
