// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignUpRequest {
  final String usernameSign;
  final String passwordSign;
  final String confirmPasswordSign;
  final String fullNameSign;
  final String addressSign;

  SignUpRequest(
      {required this.usernameSign,
      required this.passwordSign,
      required this.confirmPasswordSign,
      required this.fullNameSign,
      required this.addressSign});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'usernameSign': usernameSign,
      'passwordSign': passwordSign,
      'confirmPasswordSign': confirmPasswordSign,
      'fullNameSign': fullNameSign,
      'addressSign': addressSign,
    };
  }

  factory SignUpRequest.fromMap(Map<String, dynamic> map) {
    return SignUpRequest(
      usernameSign: map['usernameSign'] as String,
      passwordSign: map['passwordSign'] as String,
      confirmPasswordSign: map['confirmPasswordSign'] as String,
      fullNameSign: map['fullNameSign'] as String,
      addressSign: map['addressSign'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpRequest.fromJson(String source) =>
      SignUpRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
