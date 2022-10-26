class Member {
  String? id;
  String? imageUrl;
  String? name;
  String? alias;
  String? house;
  String? address;
  String? fatherId;
  String? motherId;
  String? birthYear;
  List<String?>? details;
  String? mobile;

  // for female only
  bool? isFemale;
  String? husbandName;
  List<String?>? children;
  // for inlaw only
  bool? isInlaw;
  String? fatherName;
  String? motherName;
  String? husbandId;

  List<String?>? searchStrings;

  Member({
    this.alias,
    this.house,
    this.id,
    this.name,
    this.isFemale,
    this.fatherId,
    this.motherId,
    this.birthYear,
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


    this.searchStrings,

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
    json['birthYear'] = birthYear;
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
    json['husbandId'] = husbandId;

    json['searchCase'] = searchStrings;

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
    birthYear = json['birthYear'] ??'0';
    address = json['address'] as String?;
    // print(json['details'].runtimeType);
    // print(json['details']); 
    final detailsList = json['details'] as List<dynamic>?; 
    details = detailsList?.map((e)=> e.toString()).toList();
    mobile = json['mobile'] as String?; 
    // for female
    isFemale = json['isFemale'] as bool?;
    husbandName = json['husbandName'] as String?;
    final childrenList = json['children'] as List<dynamic>?;
    children = childrenList?.map((e)=> e.toString()).toList();
    // for inLaw
    isInlaw = json['isInlaw'] as bool?;
    fatherName = json['fatherName'] as String?;
    motherName = json['motherName'] as String?;
    husbandId = json['husbandId'] as String?;
  }  
}
