import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planets_app/data/planets_repository.dart';

class PlanetDetailsUI extends ConsumerWidget {
  final String planet;

  const PlanetDetailsUI({super.key, required this.planet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / .8;
    final double aspectRatio = itemWidth / itemHeight;

    final planet = ref
        .watch(fetchPlanetsProvider)
        .value
        ?.firstWhere((p) => p.name == this.planet);
    if (planet == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
          backgroundColor: Colors.deepPurple[700],
          elevation: 0,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.deepPurple[900],
      appBar: AppBar(
        title: Text(planet.name),
        backgroundColor: Colors.deepPurple[700],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ClipOval(
              child: Image.network(
                planet.image,
                height: 260,
                width: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 16,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    planet.name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.deepPurple[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    planet.description,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: aspectRatio,
                    children: [
                      _InfoTile(
                        icon: Icons.wb_sunny,
                        label: 'Orbital Distance',
                        value:
                            '${planet.orbitalDistance.toStringAsFixed(2)} Km',
                      ),
                      _InfoTile(
                        icon: Icons.home_mini,
                        label: 'Equatorial Radius',
                        value:
                            '${planet.equatorialRadius.toStringAsFixed(2)} Km',
                      ),
                      _InfoTile(
                        icon: Icons.token,
                        label: 'Volume',
                        value: '${planet.volumen} Km³',
                      ),
                      _InfoTile(
                        icon: Icons.scale,
                        label: 'Mass Kg',
                        value: '${planet.mass.toString()} Kg',
                      ),
                      _InfoTile(
                        icon: Icons.density_medium,
                        label: 'Density',
                        value: '${planet.density.toStringAsFixed(2)} g/cm³',
                      ),
                      _InfoTile(
                        icon: Icons.arrow_downward,
                        label: 'Gravity',
                        value: '${planet.gravity.toStringAsFixed(2)} m/s²',
                      ),
                      _InfoTile(
                        icon: Icons.arrow_upward,
                        label: 'Escape Velocity',
                        value:
                            '${planet.escapeVelocity.toStringAsFixed(2)} Km/h',
                      ),
                      _InfoTile(
                        icon: Icons.access_time_filled,
                        label: 'Day Length',
                        value:
                            '${planet.dayLengthEarthDays.toStringAsFixed(2)} earth days',
                      ),
                      _InfoTile(
                        icon: Icons.event_repeat,
                        label: 'Year Length',
                        value:
                            '${planet.yearLengthEarthDays.toStringAsFixed(2)} earth years',
                      ),
                      _InfoTile(
                        icon: Icons.threesixty,
                        label: 'Year Length',
                        value: '${planet.orbitalSpeed.toStringAsFixed(2)} Km/h',
                      ),
                      _InfoTile(
                        icon: Icons.brightness_2,
                        label: 'Moons',
                        value: '${planet.moons}',
                      ),
                      _InfoTile(
                        icon: Icons.bubble_chart,
                        label: 'Atmosphere Composition',
                        value: planet.atmosphereComposition,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.deepPurple[400], size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple[800],
          ),
        ),
        Text(
          label,
          style: TextStyle(color: Colors.deepPurple[300], fontSize: 12),
        ),
      ],
    );
  }
}
