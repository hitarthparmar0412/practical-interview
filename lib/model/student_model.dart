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
    subjectA = json['category_name'];
    subjectB = json['category_name2'];
    subjectC = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['category_name'] = subjectA;
    data['category_name2'] = subjectB;
    data['category_image'] = subjectC;

    return data;
  }
}
