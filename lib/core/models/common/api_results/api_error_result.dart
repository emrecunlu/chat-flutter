import 'package:chat_client/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_error_result.g.dart';

@JsonSerializable()
class ApiErrorResult extends BaseModel<ApiErrorResult> {
  String message;
  bool success;

  ApiErrorResult({
    this.message = "",
    this.success = false,
  });

  factory ApiErrorResult.fromJson(Map<String, dynamic> json) => _$ApiErrorResultFromJson(json);

  @override
  ApiErrorResult fromJson(Map<String, dynamic> json) => _$ApiErrorResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiErrorResultToJson(this);
}
