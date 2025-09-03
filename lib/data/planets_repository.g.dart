// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planets_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$planetsRepositoryHash() => r'136889c052c27c4054866c8a6a13698d6580b463';

/// See also [planetsRepository].
@ProviderFor(planetsRepository)
final planetsRepositoryProvider =
    AutoDisposeProvider<PlanetsRepository>.internal(
      planetsRepository,
      name: r'planetsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$planetsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PlanetsRepositoryRef = AutoDisposeProviderRef<PlanetsRepository>;
String _$fetchPlanetsHash() => r'9a08e1cc3a995818d129424863fbc18e3c49ba42';

/// See also [fetchPlanets].
@ProviderFor(fetchPlanets)
final fetchPlanetsProvider = AutoDisposeFutureProvider<List<Planet>>.internal(
  fetchPlanets,
  name: r'fetchPlanetsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPlanetsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchPlanetsRef = AutoDisposeFutureProviderRef<List<Planet>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
