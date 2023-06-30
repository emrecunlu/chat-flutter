// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResult _$ApiErrorResultFromJson(Map<String, dynamic> json) =>
    ApiErrorResult(
      message: json['message'] as String? ?? "",
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$ApiErrorResultToJson(ApiErrorResult instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
