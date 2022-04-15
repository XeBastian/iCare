import 'package:http/http.dart' as http;
import 'package:icare/components.dart';
import 'package:icare/models/subject_model.dart';

class SubjectService {
  static String url = Constants.API_URL;
  static Future getLessonData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<Subject> subjects = subjectFromJson(response.body);
        return subjects;
      } else {
        return List<Subject>;
      }
    } catch (e) {
      return List<Subject>;
    }
  }
}
