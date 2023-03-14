import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String photo;

  const UserModel(
      {this.id, this.fullName = '', this.email = '', this.photo = ''});

  static const empty = UserModel(id: '');

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? photo,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photo: photo ?? this.photo,
    );
  }

  factory UserModel.fromSnapshot(DocumentSnapshot snap) {
    return UserModel(
      id: snap.id,
      fullName: snap['fullName'],
      email: snap['email'],
      photo: snap['photo'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'fullName': fullName,
      'email': email,
      'photo': photo,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, fullName, email, photo];
}
