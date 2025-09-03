class Planet {
  final String name;
  final String description;
  final String image;
  final int orbitalDistance;
  final int equatorialRadius;
  final String volumen;
  final String mass;
  final num density;
  final num gravity;
  final int escapeVelocity;
  final num dayLengthEarthDays;
  final num yearLengthEarthDays;
  final int orbitalSpeed;
  final String atmosphereComposition;
  final int moons;

  Planet({
    required this.name,
    required this.description,
    required this.image,
    required this.orbitalDistance,
    required this.equatorialRadius,
    required this.volumen,
    required this.mass,
    required this.density,
    required this.gravity,
    required this.escapeVelocity,
    required this.dayLengthEarthDays,
    required this.yearLengthEarthDays,
    required this.orbitalSpeed,
    required this.atmosphereComposition,
    required this.moons,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    try {
      print(json);
      return Planet(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        orbitalDistance: json['orbital_distance_km'],
        equatorialRadius: json['equatorial_radius_km'],
        volumen: json['volume_km3'].toString(),
        mass: json['mass_kg'],
        density: json['density_g_cm3'],
        gravity: json['surface_gravity_m_s2'],
        escapeVelocity: json['escape_velocity_kmh'],
        dayLengthEarthDays: json['day_length_earth_days'],
        yearLengthEarthDays:
            json['year_length_earth_days'] ?? json['year_length_earth_years'],
        orbitalSpeed: json['orbital_speed_kmh'],
        atmosphereComposition: json['atmosphere_composition'],
        moons: json['moons'] ?? 0,
      );
    } catch (e) {
      print('Error parsing JSON: $e');
    }
    throw Exception('Failed to parse Planet from JSON');
  }

  bool contains(String word) {
    word = word.toLowerCase();
    final values = [
      name,
      orbitalDistance.toString(),
      equatorialRadius.toString(),
      volumen,
      mass.toString(),
      density.toString(),
      gravity.toString(),
      escapeVelocity.toString(),
      dayLengthEarthDays.toString(),
      yearLengthEarthDays.toString(),
      orbitalSpeed.toString(),
      atmosphereComposition,
      moons.toString(),
    ];

    return values.any((v) => v.toLowerCase().contains(word));
  }
}
