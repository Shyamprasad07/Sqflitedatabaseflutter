class User {
  int? id;
  String? name;
  String? contact;
  String? address;
  String? landmark;
  String? pincode;
  userMap() {
    var mapping = Map<String, dynamic>();
    // ignore: unnecessary_null_in_if_null_operators
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['contact'] = contact!;
    mapping['address'] = address!;
    mapping['landmark'] = landmark!;
    mapping['pincode'] = pincode!;
    return mapping;
  }
}
