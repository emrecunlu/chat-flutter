import 'package:chat_client/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_signin_dto.g.dart';

@JsonSerializable()
class UserSigninDto extends BaseModel<UserSigninDto> {
  String email;
  String password;

  UserSigninDto({
    this.email = "",
    this.password = "",
  });

  factory UserSigninDto.fromJson(Map<String, dynamic> json) => _$UserSigninDtoFromJson(json);

  @override
  UserSigninDto fromJson(Map<String, dynamic> json) => _$UserSigninDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserSigninDtoToJson(this);
}
