// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezed_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FreezedUser _$$_FreezedUserFromJson(Map<String, dynamic> json) =>
    _$_FreezedUser(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      isPremium: json['isPremium'] as bool? ?? false,
    );

Map<String, dynamic> _$$_FreezedUserToJson(_$_FreezedUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'isPremium': instance.isPremium,
    };
