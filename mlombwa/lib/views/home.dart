import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare/controllers/auth_controller.dart';
import 'package:icare/controllers/theme.dart';
import 'package:icare/models/subject_model.dart';
import 'package:icare/services/subject_service.dart';
import 'package:icare/views/subject_page.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Subject>? _allSubjects;
  bool? _loading = true;
  @override
  void initState() {
    super.initState();
    SubjectService.getLessonData().then(
      (subjects) => {
        setState(
          () {
            _allSubjects = subjects;
            _loading = false;
          },
        )
      },
    );
  }

  // final List<Widget> _enrolledSubjectList = [];
  final List<Widget> _enrolledSubjectList = [];
  bool _enrolled = false;

  void displayMenu(
      {BuildContext? context,
      VoidCallback? menuTapHandler,
      String? popupMenuValue,
      String? displayText}) {
    showMenu(
        context: context!,
        position: const RelativeRect.fromLTRB(50, -50, 10, 0),
        items: [
          PopupMenuItem(
            value: popupMenuValue!,
            child: Text(displayText!),
            onTap: menuTapHandler,
          ),
        ]);
  }

  void chipTapHandler({List<Subject>? subject, int? index}) {
    setState(
      () {
        _enrolled = true;
        _enrolledSubjectList.add(
          ListTile(
            key: ValueKey(subject![index!].subjectName),
            title: Text(subject[index].subjectName),
            onLongPress: () {
              displayMenu(
                  menuTapHandler: () {
                    setState(() {
                      _enrolledSubjectList.removeAt(index);
                    });
                  },
                  context: context,
                  displayText: 'Unenroll',
                  popupMenuValue: 'Unenroll');
            },
            onTap: () {
              Get.to(() => SubjectPage(allSubjects: subject[index]));
            },
          ),
        );
      },
    );
  }

  Widget displayUserDetails() {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(
                    auth.auth.currentUser!.displayName!,
                    style: Get.isDarkMode
                        ? IcareTheme.darkTextTheme.headline3
                        : IcareTheme.lightTextTheme.headline3,
                  ),
                ),
                Flexible(
                  child: Text(
                    auth.auth.currentUser!.email!,
                    style: Get.isDarkMode
                        ? IcareTheme.darkTextTheme.headline5
                        : IcareTheme.lightTextTheme.headline5,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.edit),
                  )),
            )
          ],
        ),
      ),
    );
  }

  DateTime date = DateTime.now();
  DateFormat formatter = DateFormat.yMMMMd();

  Widget displayCalendar() {
    return Card(
        margin: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Icon(
                Icons.event,
                size: 35,
              ),
              const Spacer(),
              Text(
                formatter.format(date),
                style: Get.isDarkMode
                    ? IcareTheme.darkTextTheme.headline3
                    : IcareTheme.lightTextTheme.headline3,
              ),
            ],
          ),
        ));
  }

  Widget displayEnrolledCard() {
    return Card(
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text('Currently Enrolled'),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              height: Get.size.height,
              child: _enrolledSubjectList.isEmpty
                  ? const Center(
                      child: Text(
                        'You are not yet Enrolled in any Class',
                        textAlign: TextAlign.center,
                      ),
                    )
                  : ListView(
                      children: _enrolledSubjectList,
                    ),
            ),
          )
        ],
      ),
    );
  }

  AuthController auth = AuthController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('i-Care'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                                height: size.height,
                                width: size.width,
                                child: displayUserDetails()),
                          ),
                          Expanded(
                            flex: 5,
                            child: SizedBox(
                              height: size.height,
                              width: size.width,
                              child: displayCalendar(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: displayEnrolledCard(),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0, left: 12),
                        child: Text('All Lessons'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: size.height,
                          child: _loading!
                              ? Shimmer.fromColors(
                                  period: const Duration(milliseconds: 800),
                                  child: ListView.builder(
                                    primary: true,
                                    itemCount: 12,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Container(
                                          width: 48.0,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        subtitle: Container(
                                          width: size.width,
                                          height: 8.0,
                                          color: Colors.white,
                                        ),
                                        trailing: ActionChip(
                                          label: Container(
                                            width: 12.0,
                                            height: 6.0,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        ),
                                      );
                                    },
                                  ),
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!)
                              : ListView.builder(
                                  primary: true,
                                  itemCount:
                                      _loading! ? 0 : _allSubjects!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Subject subject = _allSubjects![index];

                                    return ListTile(
                                      title: Text(subject.subjectName),
                                      subtitle: Text(subject.aboutSubject),
                                      trailing: ActionChip(
                                        label: Text(
                                            _enrolled ? 'Unenroll' : 'Enroll'),
                                        onPressed: () {
                                          chipTapHandler(
                                            index: index,
                                            subject: _allSubjects!,
                                          );
                                        },
                                      ),
                                      onTap: () {
                                        Get.to(() =>
                                            SubjectPage(allSubjects: subject));
                                      },
                                    );
                                  },
                                ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
