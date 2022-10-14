class Member {
  String? id;
  String? imageUrl;
  String? name;
  String? alias;
  String? house;
  String? address;
  String? fatherId;
  String? motherId;
  List<String>? details;
  String? mobile;

  // for female only
  bool? isFemale;
  String? husbandName;
  List<String>? children;
  // for inlaw only
  bool? isInlaw;
  String? fatherName;
  String? motherName;
  String? husbandId;

  Member({
    this.alias,
    this.house,
    this.id,
    this.name,
    this.isFemale,
    this.fatherId,
    this.motherId,
    this.details,
    this.mobile,
    this.imageUrl,
    this.husbandName,
    this.address,
    this.children,
    this.isInlaw,
    this.fatherName,
    this.motherName,
    this.husbandId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['id'] = id;
    json['imageUrl'] = imageUrl;
    json['alias'] = alias;
    json['house'] = house;
    json['fatherId'] = fatherId;
    json['motherId'] = motherId;
    json['address'] = address;
    json['details'] = details;
    json['mobile'] = mobile;
    //  for female
    json['isFemale'] = isFemale;
    json['husbandName'] = husbandName;
    json['children'] = children;
    // for inLaw
    json['isInlaw'] = isInlaw;
    json['fatherName'] = fatherName;
    json['motherName'] = motherName;
    json['motherName'] = husbandId;

    return json;
  }

  Member.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'] as String?;
    imageUrl = json['imageUrl'] as String?;
    alias = json['alias'] as String?;
    house = json['house'] as String?;
    fatherId = json['fatherId'] as String?;
    motherId = json['motherId'] as String?;
    address = json['address'] as String?;
    details = json['details'] as List<String>?;
    mobile = json['mobile'] as String?;
    // for female
    isFemale = json['isFemale'] as bool?;
    husbandName = json['husbandName'] as String?;
    children = json['children'] as List<String>?;
    // for inLaw
    isInlaw = json['isInlaw'] as bool?;
    fatherName = json['fatherName'] as String?;
    motherName = json['motherName'] as String?;
    husbandId = json['husbandId'] as String?;
  }
}
