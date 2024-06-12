import 'dart:convert';

import 'package:collection/collection.dart';

import 'answers_data.dart';

List<Question> fromJsonQuestionData(String data) =>
    List<Question>.from(jsonDecode(data).map(
      (e) => Question.fromJson(e),
    ));

String toJsonQuestionData(List<Question> data) => jsonEncode(data);

class Question {
  String countryFlagImage;
  String question;
  List<Answer> answers;

  Question({
    required this.countryFlagImage,
    required this.question,
    required this.answers,
  });

  factory Question.fromJson(Map<String, Object?> json) => Question(
        countryFlagImage: json["countryFlagImage"] as String,
        question: json["question"] as String,
        answers: List<Answer>.from(
          (json["answers"] as List<Object?>)
              .map((e) => Answer.fromJson(e as Map<String, Object?>)),
        ),
      );

  Map<String, Object?> toJson() => {
        "countryFlagImage": countryFlagImage,
        "question": question,
        "answers": answers.map((e) => e.toJson()).toList(),
      };

  @override
  int get hashCode => Object.hash(countryFlagImage, question, answers);

  @override
  bool operator ==(Object other) {
    ListEquality listEquality = ListEquality<Answer>();

    return identical(this, other) ||
        other is Question &&
            runtimeType == other.runtimeType &&
            countryFlagImage == other.countryFlagImage &&
            question == other.question &&
            listEquality.equals(answers, other.answers);
  }

  Question copyWith({
    String? countryFlagImage,
    String? question,
    List<Answer>? answers,
  }) =>
      Question(
        countryFlagImage: countryFlagImage ?? this.countryFlagImage,
        question: question ?? this.question,
        answers: answers ?? this.answers,
      );

  @override
  String toString() {
    return "Question{\n"
        "\tcountryFlagImage: $countryFlagImage,\n"
        "\tquestion: $question,\n"
        "\tanswers: $answers,\n"
        "}";
  }
}
