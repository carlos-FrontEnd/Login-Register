import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF0C112E),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SvgPicture.asset(
                'assets/vector.svg',
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Angatsu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple[700],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}