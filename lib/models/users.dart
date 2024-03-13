class Users{
  late var Id;
  late String name;
  late String phoneNumber;


  Users({
    required this.Id,
    required this.name,
    required this.phoneNumber
    });



  //Метод конвертации объекта в json формат
  Map<String, dynamic> toJson(){
    return {
      'Id': Id,
      'Name':name,
      'PhoneNumber' : phoneNumber,
    };
  }



  //Метод создания объекта из json
  static Users fromJson(Map<String, dynamic> json){
    return Users(
        Id: json['Id'],
        name: json['Name'],
        phoneNumber: json['PhoneNumber'],
    );
  }


}