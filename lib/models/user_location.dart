class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCordianates cordianates;
  final LocationTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.cordianates,
    required this.street,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final cordianates = LocationCordianates.fromMap(json['cordianates']);
    final street = LocationStreet.fromMap(json['street']);
    final timezone = LocationTimezone.fromMap(json['timezone']);

    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      cordianates: cordianates,
      street: street,
      timezone: timezone,
    );
  }
}

class LocationTimezone {
  final String offset;
  final String description;
  LocationTimezone({
    required this.description,
    required this.offset,
  });
  factory LocationTimezone.fromMap(Map<String, dynamic> json) {
    return LocationTimezone(
      description: json['description'],
      offset: json['offset'],
    );
  }
}

class LocationCordianates {
  final String latitude;
  final String longitude;
  LocationCordianates({
    required this.latitude,
    required this.longitude,
  });
  factory LocationCordianates.fromMap(Map<String, dynamic> json) {
    return LocationCordianates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class LocationStreet {
  final String name;
  final String number;
  LocationStreet({
    required this.name,
    required this.number,
  });
  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      name: json['name'],
      number: json['number'].toString(),
    );
  }
}
