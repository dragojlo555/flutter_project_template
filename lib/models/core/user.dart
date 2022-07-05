class User {
  final int id;
  final String? name;
  final String? username;
  final String? email;
  // final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  User({
    required this.id,
    this.name,
    this.username,
    this.email,
    // this.address,
    this.phone,
    this.website,
    this.company,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String?,
        username = json['username'] as String?,
        email = json['email'] as String?,
        // address = (json['address'] as Map<String, dynamic>?) != null
        //     ? Address.fromJson(json['address'] as Map<String, dynamic>)
        //     : null,
        phone = json['phone'] as String?,
        website = json['website'] as String?,
        company = (json['company'] as Map<String, dynamic>?) != null
            ? Company.fromJson(json['company'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'username': username,
        'email': email,
        // 'address': address?.toJson(),
        'phone': phone,
        'website': website,
        'company': company?.toJson()
      };
}

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'] as String?,
        suite = json['suite'] as String?,
        city = json['city'] as String?,
        zipcode = json['zipcode'] as String?,
        geo = (json['geo'] as Map<String, dynamic>?) != null
            ? Geo.fromJson(json['geo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geo?.toJson()
      };
}

class Geo {
  final String? lat;
  final String? lng;

  Geo({
    this.lat,
    this.lng,
  });

  Geo.fromJson(Map<String, dynamic> json)
      : lat = json['lat'] as String?,
        lng = json['lng'] as String?;

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  Company.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        catchPhrase = json['catchPhrase'] as String?,
        bs = json['bs'] as String?;

  Map<String, dynamic> toJson() =>
      {'name': name, 'catchPhrase': catchPhrase, 'bs': bs};
}
