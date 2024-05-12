// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FreezedUser _$FreezedUserFromJson(Map<String, dynamic> json) {
  return _FreezedUser.fromJson(json);
}

/// @nodoc
mixin _$FreezedUser {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get isPremium => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezedUserCopyWith<FreezedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezedUserCopyWith<$Res> {
  factory $FreezedUserCopyWith(
          FreezedUser value, $Res Function(FreezedUser) then) =
      _$FreezedUserCopyWithImpl<$Res, FreezedUser>;
  @useResult
  $Res call(
      {int id, String username, String email, String phone, bool isPremium});
}

/// @nodoc
class _$FreezedUserCopyWithImpl<$Res, $Val extends FreezedUser>
    implements $FreezedUserCopyWith<$Res> {
  _$FreezedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? isPremium = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreezedUserCopyWith<$Res>
    implements $FreezedUserCopyWith<$Res> {
  factory _$$_FreezedUserCopyWith(
          _$_FreezedUser value, $Res Function(_$_FreezedUser) then) =
      __$$_FreezedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String username, String email, String phone, bool isPremium});
}

/// @nodoc
class __$$_FreezedUserCopyWithImpl<$Res>
    extends _$FreezedUserCopyWithImpl<$Res, _$_FreezedUser>
    implements _$$_FreezedUserCopyWith<$Res> {
  __$$_FreezedUserCopyWithImpl(
      _$_FreezedUser _value, $Res Function(_$_FreezedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? phone = null,
    Object? isPremium = null,
  }) {
    return _then(_$_FreezedUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      isPremium: null == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FreezedUser implements _FreezedUser {
  const _$_FreezedUser(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone,
      this.isPremium = false});

  factory _$_FreezedUser.fromJson(Map<String, dynamic> json) =>
      _$$_FreezedUserFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String phone;
  @override
  @JsonKey()
  final bool isPremium;

  @override
  String toString() {
    return 'FreezedUser(id: $id, username: $username, email: $email, phone: $phone, isPremium: $isPremium)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FreezedUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, email, phone, isPremium);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreezedUserCopyWith<_$_FreezedUser> get copyWith =>
      __$$_FreezedUserCopyWithImpl<_$_FreezedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FreezedUserToJson(
      this,
    );
  }
}

abstract class _FreezedUser implements FreezedUser {
  const factory _FreezedUser(
      {required final int id,
      required final String username,
      required final String email,
      required final String phone,
      final bool isPremium}) = _$_FreezedUser;

  factory _FreezedUser.fromJson(Map<String, dynamic> json) =
      _$_FreezedUser.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String get phone;
  @override
  bool get isPremium;
  @override
  @JsonKey(ignore: true)
  _$$_FreezedUserCopyWith<_$_FreezedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
