
import 'package:educational/models/lesson.dart';
import 'package:flutter/material.dart';
import '../widget/custom_icon_button.dart';
import '../widget/custom_video._play.dart';
import '../widget/list_of_lesson.dart';
import 'course.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({
    super.key,
    required this.course,
  });
  final Course course;

  @override
  State<CourseDetailScreen> createState() {
    return _CourseDetailScreenState();
  }
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                        child: const Icon(Icons.arrow_back),
                        height: 35,
                        width: 40,
                        ontap: () {
                          Navigator.pop(context);
                        }),
                    const Spacer(),
                    const Text(
                      'Flutter',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 25.0),
                CustomVideo(),
                const SizedBox(height: 15.0),
                Text(
                  widget.course.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Author ${widget.course.author}",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      color: Colors.black45,
                    ),
                    Text(
                      '4.8',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.black45),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.alarm_rounded,
                      ),
                    ),
                    Text(
                      '72 Hours',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45),
                    ),
                    Spacer(),
                    Text(
                      '\$50',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurpleAccent),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                MyTabView(
                    changeTab: (int index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    index: selectedIndex),
                selectedIndex == 0 ? const Playlist() : const Description(),
              ],
            ),
          ),
        ),
        bottomSheet: BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  CustomIconButton(
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                      height: 40,
                      width: 40,
                      ontap: () {}),
                  const SizedBox(width: 20.0),
                  Expanded(
                    child: CustomIconButton(
                        child: const Text(
                          'Enroll Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        color: Colors.deepPurpleAccent,
                        height: 45,
                        width: 45,
                        ontap: () {}),
                  )
                ],
              ),
            );
          },
        ));
  }
}

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
        return ListOfLesson(lesson: lessonList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: lessonList.length,
      padding: EdgeInsets.only(top: 20, bottom: 40),
      shrinkWrap: true,
    ));
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
          '''Flutter is an open-source UI software development kit created by Google. 
      It is used to develop cross-platform applications from a single codebase for various platforms, 
      including Android, iOS, web, Linux, macOS, and Windows  '''),
    );
  }
}

class MyTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const MyTabView({super.key, required this.changeTab, required this.index});

  @override
  State<MyTabView> createState() => _MyTabViewState();
}

class _MyTabViewState extends State<MyTabView> {
  final List<String> myList = ['Playlist (22)', 'Description'];

  Widget buildTag(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: 15.0),
        decoration: BoxDecoration(
            color: widget.index == index ? Colors.deepPurpleAccent : null,
            borderRadius: BorderRadius.circular(10.0)),
        child: Text(
          myList[index],
          style: TextStyle(
            color: widget.index != index ? Colors.black : Colors.white,
            fontWeight:
                widget.index == index ? FontWeight.bold : FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.9),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: myList
            .asMap()
            .entries
            .map((MapEntry map) => buildTag(map.key))
            .toList(),
      ),
    );
  }
}
