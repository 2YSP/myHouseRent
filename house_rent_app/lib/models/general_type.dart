class GeneralType{

  final String name;
  final String id;

  GeneralType(this.name, this.id);

  Map<String,dynamic> toJson(){
    var map = Map<String,dynamic>();
    map['name'] = name;
    map['id'] = id;
    return map;
  }

  factory GeneralType.fromJson(Map<String,dynamic> map) => GeneralType(
    map['name'] as String,
    map['id'] as String,
  );
}