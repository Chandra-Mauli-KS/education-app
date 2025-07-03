import 'package:flutter/material.dart';
import '../models/course.dart';
import '../models/lesson.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_video._play.dart';
import '../widget/list_of_lesson.dart';

class CourseDetailScreen extends StatefulWidget {
  final Course course;
  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Header
              Row(
                children: [
                  CustomIconButton(
                    child: const Icon(Icons.arrow_back),
                    height: 40,
                    width: 40,
                    ontap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.course.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              CustomVideo(),

              const SizedBox(height: 16),
              Text(
                widget.course.name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              Text(
                "Author: ${widget.course.author}",
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),

              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const SizedBox(width: 4),
                  const Text("4.8"),
                  const SizedBox(width: 16),
                  const Icon(Icons.access_time, color: Colors.grey),
                  const SizedBox(width: 4),
                  const Text("72 Hours"),
                  const Spacer(),
                  Text(
                    '\₹50',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              MyTabView(
                selectedIndex: selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => selectedTabIndex = index);
                },
              ),

              const SizedBox(height: 10),
              Expanded(
                child: selectedTabIndex == 0
                    ? const Playlist()
                    : const Description(),
              ),
            ],
          ),
        ),
      ),

      // 🔸 Bottom Enroll Section
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomIconButton(
              child: const Icon(Icons.favorite, color: Colors.red),
              height: 45,
              width: 45,
              ontap: () {},
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Enroll Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🔹 Playlist Widget
class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 100, top: 12),
      itemCount: lessonList.length,
      itemBuilder: (context, index) => ListOfLesson(lesson: lessonList[index]),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
    );
  }
}

// 🔸 Description Widget
class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100, top: 12),
      child: Text(
        '''Flutter is an open-source UI toolkit developed by Google for building beautiful, natively compiled applications for mobile, web, desktop from a single codebase.''',
        style: TextStyle(fontSize: 15, height: 1.5),
      ),
    );
  }
}

// 🔘 TabView Widget
class MyTabView extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  const MyTabView({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Playlist (22)', 'Description'];

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabSelected(index),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color:
                      isActive ? Colors.deepPurpleAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  tabs[index],
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black87,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
