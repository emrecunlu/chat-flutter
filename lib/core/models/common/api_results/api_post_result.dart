import 'package:chat_client/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_post_result.g.dart';

@JsonSerializable()
class ApiPostResult extends BaseModel<ApiPostResult> {
  String? message;
  bool success;

  ApiPostResult({
    this.message,
    this.success = false,
  });

  factory ApiPostResult.fromJson(Map<String, dynamic> json) => _$ApiPostResultFromJson(json);

  @override
  ApiPostResult fromJson(Map<String, dynamic> json) => _$ApiPostResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiPostResultToJson(this);
}
