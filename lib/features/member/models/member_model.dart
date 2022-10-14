class Member {
  String? id;
  String? imageURL;
  String? name;
  String? alias;
  String? house;
  String? fatherId;
  String? motherId;
  List<String>? details;
  String? mobile;
  List<String>? spouse;

  Member({
    this.alias,
    this.house,
    this.id,
    this.name,
    this.fatherId,
    this.motherId,
    this.spouse,
    this.details,
    this.mobile,
    this.imageURL,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['imageUrl'] = imageURL;
    data['alias'] = alias;
    data['house'] = house;
    data['fatherId'] = fatherId;
    data['motherId'] = motherId;
    data['details'] = details;
    data['mobile'] = mobile;
    data['spouse'] = spouse;
    return data;
  }

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageURL = json['imageUrl'];
    alias = json['alias'];
    house = json['house'];
    fatherId = json['fatherId'];
    motherId = json['motherId'];
    details = json['details'];
    mobile = json['mobile'];
    spouse = json['spouse'];
  }
}
