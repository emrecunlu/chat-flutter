// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSigninDto _$UserSigninDtoFromJson(Map<String, dynamic> json) =>
    UserSigninDto(
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$UserSigninDtoToJson(UserSigninDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
