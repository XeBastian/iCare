import 'package:flutter/material.dart';
import 'package:icare/models/subject_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key, this.allSubjects, this.indexVal})
      : super(key: key);
  final Subject? allSubjects;
  final int? indexVal;
  @override
  State<LessonPage> createState() => _WebState();
}

class _WebState extends State<LessonPage> {
  @override
  void initState() {
    super.initState();
    WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.allSubjects!.lessons[widget.indexVal!].lessonData.name),
      ),
      body: WebView(
        initialUrl:
            widget.allSubjects!.lessons[widget.indexVal!].lessonData.lessonLink,
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
