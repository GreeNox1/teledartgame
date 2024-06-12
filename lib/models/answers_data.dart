class Answer {
  String answer;
  bool isSelected;
  bool isCorrect;

  Answer({
    required this.answer,
    this.isSelected = false,
    this.isCorrect = false,
  });

  factory Answer.fromJson(Map<String, Object?> json) => Answer(
    answer: json["answer"] as String,
    isSelected: json["isSelected"] as bool,
    isCorrect: json["isCorrect"] as bool,
  );

  Map<String, Object?> toJson() => {
    "answer": answer,
    "isSelected": isSelected,
    "isCorrect": isCorrect,
  };

  @override
  int get hashCode => Object.hash(
    answer,
    isSelected,
    isCorrect,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Answer &&
              answer == other.answer &&
              isSelected == other.isSelected &&
              isCorrect == other.isCorrect;

  Answer copyWith({
    String? answer,
    bool? isSelected,
    bool? isCorrect,
  }) =>
      Answer(
        answer: answer ?? this.answer,
        isSelected: isSelected ?? this.isSelected,
        isCorrect: isCorrect ?? this.isCorrect,
      );

  @override
  String toString() {
    return "Answer{\n"
        "\t\tanswer: $answer,\n"
        "\t\tisSelected: $isSelected,\n"
        "\t\tisCorrect: $isCorrect,\n"
        "\t}";
  }
}