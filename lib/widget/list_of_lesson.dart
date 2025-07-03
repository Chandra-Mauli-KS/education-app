import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../models/lesson.dart';

class ListOfLesson extends StatelessWidget {
  final Lesson lesson;
  const ListOfLesson({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? const Icon(
                Icons.play_circle,
                color: Colors.deepPurpleAccent,
                size: 40,
              )
            : const Icon(Icons.play_circle_outline,
                color: Colors.deepPurpleAccent, size: 40),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson.name,
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: lesson.isCompleted ? Colors.black : Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                lesson.name,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 15.0),
        lesson.isCompleted
            ? const Icon(
                Iconsax.tick_circle,
                color: Colors.green,
                size: 30,
              )
            : Icon(Iconsax.lock_circle, color: Colors.amber[400], size: 30),
      ],
    );
  }
}
