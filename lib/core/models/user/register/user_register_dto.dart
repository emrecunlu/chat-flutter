import 'package:chat_client/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_register_dto.g.dart';

@JsonSerializable()
class UserRegisterDto extends BaseModel<UserRegisterDto> {
  String userName;
  String email;
  String password;

  UserRegisterDto({
    this.userName = "",
    this.email = "",
    this.password = "",
  });

  factory UserRegisterDto.fromJson(Map<String, dynamic> json) => _$UserRegisterDtoFromJson(json);

  @override
  UserRegisterDto fromJson(Map<String, dynamic> json) => _$UserRegisterDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserRegisterDtoToJson(this);
}
