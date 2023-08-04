class Pincode {
  final String message;
  final String status;
  final List<PostOffice> postOffice;

  Pincode({
    required this.message,
    required this.status,
    required this.postOffice,
  });

  factory Pincode.fromJson(Map<String, dynamic> json) => Pincode(
        message: json["Message"],
        status: json["Status"],
        postOffice: List<PostOffice>.from(
            json["PostOffice"].map((x) => PostOffice.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "PostOffice": List<dynamic>.from(postOffice.map((x) => x.toJson())),
      };
}

class PostOffice {
  final String name;
  final dynamic description;
  final String branchType;
  final String deliveryStatus;
  final String circle;
  final String district;
  final String division;
  final String region;
  final String block;
  final String state;
  final String country;
  final String pincode;

  PostOffice({
    required this.name,
    required this.description,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) => PostOffice(
        name: json["Name"],
        description: json["Description"],
        branchType: json["BranchType"],
        deliveryStatus: json["DeliveryStatus"],
        circle: json["Circle"],
        district: json["District"],
        division: json["Division"],
        region: json["Region"],
        block: json["Block"],
        state: json["State"],
        country: json["Country"],
        pincode: json["Pincode"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Description": description,
        "BranchType": branchType,
        "DeliveryStatus": deliveryStatus,
        "Circle": circle,
        "District": district,
        "Division": division,
        "Region": region,
        "Block": block,
        "State": state,
        "Country": country,
        "Pincode": pincode,
      };
}
