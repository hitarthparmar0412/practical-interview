class Student {
  int? cid;
  String name;
  String? image;
  String? maths;
  String? science;
  String? history;

  Student({
    required this.name,
    this.cid,
    this.maths,
    this.science,
    this.history,
  });

  // Student.fromJson(Map<String, dynamic> json) {
  //   cid = json['cid'];
  //   subjectC = json[''];
  //   subjectA = json['subject_a'];
  //   subjectB = json['subject_b'];
  //   subjectC = json['subject_c'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['cid'] = cid;
  //   data['subject_a'] = subjectA;
  //   data['subject_b'] = subjectB;
  //   data['subject_c'] = subjectC;

  //   return data;
  // }
}
