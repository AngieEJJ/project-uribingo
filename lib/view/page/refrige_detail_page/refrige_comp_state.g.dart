// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refrige_comp_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RefrigeCompStateImpl _$$RefrigeCompStateImplFromJson(
        Map<String, dynamic> json) =>
    _$RefrigeCompStateImpl(
      foodItems: (json['foodItems'] as List<dynamic>?)
              ?.map((e) => FoodDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isManager: json['isManager'] as bool? ?? false,
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$$RefrigeCompStateImplToJson(
        _$RefrigeCompStateImpl instance) =>
    <String, dynamic>{
      'foodItems': instance.foodItems,
      'isManager': instance.isManager,
      'isLoading': instance.isLoading,
    };
