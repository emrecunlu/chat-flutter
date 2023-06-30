// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_post_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiPostResult _$ApiPostResultFromJson(Map<String, dynamic> json) =>
    ApiPostResult(
      message: json['message'] as String?,
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$ApiPostResultToJson(ApiPostResult instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
