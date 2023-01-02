  class Users
  {
    int? id;
    String? name;
    String? contact;
    String? address;
    String? landmark;
    String? pincode;
     userMap(){
      var mapping = Map<String,dynamic>();
      mapping['id']=id??null;
      mapping['name']=name!;
      mapping['contact']=contact!;
      mapping['address']=address!;
      mapping['landmark']=landmark!;
      mapping['pincode']=pincode!;
      return mapping;


     }

  }