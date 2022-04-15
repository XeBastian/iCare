import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare/views/lesson_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/subject_model.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key, this.allSubjects}) : super(key: key);
  final Subject? allSubjects;
  Widget buildCarousel() {
    return CarouselSlider(
      items: allSubjects!.subjectImages
          .map(
            (item) => Container(
              height: Get.size.height,
              width: Get.size.width,
              child: CachedNetworkImage(
                imageUrl: item,
                fit: BoxFit.cover,
                width: Get.size.width,
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: Get.size.height,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(allSubjects!.subjectName),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 200,
                  child: buildCarousel(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              //  TabBarView
              Expanded(
                flex: 7,
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 4,
                  child: Column(
                    children: [
                      ButtonsTabBar(
                        tabs: const [
                          Tab(
                            icon: Icon(Icons.info),
                            text: "About",
                          ),
                          Tab(
                            icon: Icon(Icons.book_outlined),
                            text: "Lessons",
                          ),
                          Tab(
                            icon: Icon(Icons.access_time_outlined),
                            text: "Reviews",
                          ),
                          Tab(
                            icon: Icon(Icons.book_outlined),
                            text: "Resources",
                          ),
                        ],
                        backgroundColor: Colors.brown,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Center(child: buildAbout()),
                            buildLessons(),
                            Center(child: buildReviews()),
                            buildResources(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLessons() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        var nxtIndex = index + 1;
        return ListTile(
          leading: Text(nxtIndex.toString()),
          title: Text(allSubjects!.lessons[index].lessonData.name),
          subtitle: Text(allSubjects!.lessons[index].lessonData.duration),
          trailing: ActionChip(
            onPressed: () {},
            label: const Icon(Icons.access_time_outlined),
          ),
          onTap: () {
            Get.to(() => LessonPage(
                  allSubjects: allSubjects,
                  indexVal: index,
                ));
          },
        );
      },
    );
  }

  Widget buildAbout() {
    return Center(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return Text(allSubjects!.lessons[index].lessonData.description,
              textAlign: TextAlign.center);
        },
      ),
    );
  }

  Widget buildResources() {
    return ListView.builder(
      itemCount: allSubjects!.resources.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(allSubjects!.resources[index].resourceName),
          trailing: Chip(
            label: Text(allSubjects!.resources[index].resourceType),
          ),
          onTap: () {
            //Navigate to Webview
            Get.to(
              () => Web(
                imgUrl: allSubjects!.resources[index].resourceUrl,
                title: allSubjects!.resources[index].resourceName,
              ),
            );
          },
        );
      },
    );
  }

  Widget buildReviews() {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Its Me Again', textAlign: TextAlign.center),
    );
  }
}

class Web extends StatefulWidget {
  const Web({Key? key, required this.title, required this.imgUrl})
      : super(key: key);
  final String imgUrl;
  final String? title;
  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  @override
  void initState() {
    super.initState();
    WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: WebView(
        initialUrl: widget.imgUrl,
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
