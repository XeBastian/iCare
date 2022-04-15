// To parse this JSON data, do
//
//     final subject = subjectFromJson(jsonString);

import 'dart:convert';

List<Subject> subjectFromJson(String str) =>
    List<Subject>.from(json.decode(str).map((x) => Subject.fromJson(x)));

String subjectToJson(List<Subject> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subject {
  Subject({
    required this.subjectId,
    required this.subjectName,
    required this.aboutSubject,
    required this.subjectImages,
    required this.status,
    required this.resources,
    required this.lessons,
  });

  String subjectId;
  String subjectName;
  String aboutSubject;
  List<String> subjectImages;
  bool status;
  List<Resource> resources;
  List<Lesson> lessons;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subjectId: json["subjectID"],
        subjectName: json["subjectName"],
        aboutSubject: json["aboutSubject"],
        subjectImages: List<String>.from(json["subjectImages"].map((x) => x)),
        status: json["status"],
        resources: List<Resource>.from(
            json["resources"].map((x) => Resource.fromJson(x))),
        lessons:
            List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjectID": subjectId,
        "subjectName": subjectName,
        "aboutSubject": aboutSubject,
        "subjectImages": List<dynamic>.from(subjectImages.map((x) => x)),
        "status": status,
        "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
        "lessons": List<dynamic>.from(lessons.map((x) => x.toJson())),
      };
}

class Lesson {
  Lesson({
    required this.lessonData,
  });

  LessonData lessonData;

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        lessonData: LessonData.fromJson(json["lessonData"]),
      );

  Map<String, dynamic> toJson() => {
        "lessonData": lessonData.toJson(),
      };
}

class LessonData {
  LessonData({
    required this.name,
    required this.duration,
    required this.description,
    required this.lessonLink,
  });

  String name;
  String duration;
  String description;
  String lessonLink;

  factory LessonData.fromJson(Map<String, dynamic> json) => LessonData(
        name: json["name"],
        duration: json["duration"],
        description: json["description"],
        lessonLink: json["lessonLink"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "duration": duration,
        "description": description,
        "lessonLink": lessonLink,
      };
}

class Resource {
  Resource({
    required this.resourceName,
    required this.resourceUrl,
    required this.resourceType,
  });

  String resourceName;
  String resourceUrl;
  String resourceType;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        resourceName: json["resourceName"],
        resourceUrl: json["resourceUrl"],
        resourceType: json["resourceType"],
      );

  Map<String, dynamic> toJson() => {
        "resourceName": resourceName,
        "resourceUrl": resourceUrl,
        "resourceType": resourceType,
      };
}
