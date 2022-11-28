class Category {
  int? cid;
  String? subjectA;
  String? subjectB;
  String? subjectC;

  Category({
    this.cid,
    this.subjectA,
    this.subjectB,
    this.subjectC,
  });

  Category.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    subjectA = json['subject_a'];
    subjectB = json['subject_b'];
    subjectC = json['subject_c'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['subject_a'] = subjectA;
    data['subject_b'] = subjectB;
    data['subject_c'] = subjectC;

    return data;
  }
}
