import 'dart:convert';

class SignUpResponseModel {
  final String? status;
  final String? code;
  final String? message;

  SignUpResponseModel(this.status, this.code, this.message);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'code': code,
      'message': message,
    };
  }

  factory SignUpResponseModel.fromMap(Map<String, dynamic> map) {
    return SignUpResponseModel(
      map['status'] != null ? map['status'] as String : null,
      map['code'] != null ? map['code'] as String : null,
      map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpResponseModel.fromJson(String source) =>
      SignUpResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
