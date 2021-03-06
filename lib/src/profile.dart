import 'package:enigma_web/src/i_profile.dart';
import 'package:meta/meta.dart';

import 'enums.dart' show EnigmaType;

class Profile implements IProfile {
  @override
  final String address;
  @override
  final EnigmaType enigma;
  @override
  final int httpPort;
  @override
  final String name;
  @override
  final String password;
  @override
  final bool useSsl;
  @override
  final String username;
  @override
  final int streamingPort;
  @override
  final bool transcoding;
  @override
  final int transcodingPort;
  @override
  final bool streaming;
  @override
  final String id;

  Profile({
    @required @required this.address,
    this.enigma = EnigmaType.enigma2,
    this.httpPort = 80,
    @required this.name,
    this.password = 'dreambox',
    this.useSsl = false,
    this.username = 'root',
    this.streamingPort,
    this.transcoding = false,
    this.transcodingPort,
    @required this.streaming,
    @required this.id,
  })  : assert(address != null),
        assert(address.isNotEmpty),
        assert(enigma != null),
        assert(httpPort != null),
        assert(name != null),
        assert(password != null),
        assert(useSsl != null),
        assert(username != null),
        assert(transcoding != null),
        assert(streaming != null),
        assert(id != null);

  Profile copyWith({
    String address,
    EnigmaType enigma,
    int httpPort,
    String name,
    String password,
    bool useSsl,
    String username,
    int streamingPort,
    bool transcoding,
    int transcodingPort,
    bool streaming,
    String id,
  }) {
    return Profile(
      address: address ?? this.address,
      enigma: enigma ?? this.enigma,
      httpPort: httpPort ?? this.httpPort,
      name: name ?? this.name,
      password: password ?? this.password,
      useSsl: useSsl ?? this.useSsl,
      username: username ?? this.username,
      streamingPort: streamingPort ?? this.streamingPort,
      transcoding: transcoding ?? this.transcoding,
      transcodingPort: transcodingPort ?? this.transcodingPort,
      streaming: streaming ?? this.streaming,
      id: id ?? this.id,
    );
  }

  @override
  int get hashCode =>
      name.hashCode ^
      username.hashCode ^
      password.hashCode ^
      enigma.hashCode ^
      address.hashCode ^
      httpPort.hashCode ^
      useSsl.hashCode ^
      streamingPort.hashCode ^
      transcodingPort.hashCode ^
      transcoding.hashCode ^
      streaming.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          runtimeType == other.runtimeType &&
          transcodingPort == other.transcodingPort &&
          transcoding == other.transcoding &&
          streaming == other.streaming &&
          name == other.name &&
          username == other.username &&
          password == other.password &&
          enigma == other.enigma &&
          address == other.address &&
          httpPort == other.httpPort &&
          useSsl == other.useSsl &&
          streamingPort == other.streamingPort &&
          id == other.id;

  @override
  String toString() {
    return 'Profile $name, address $address, port: $httpPort, enigma: $enigma';
  }

  @override
  Profile.fromJson(Map<String, dynamic> json)
      : transcodingPort = json['transcodingPort'],
        transcoding = json['transcoding'],
        streaming = json['streaming'],
        name = json['name'],
        username = json['username'],
        password = json['password'],
        enigma = EnigmaType.values[json['enigma']],
        address = json['address'],
        httpPort = json['httpPort'],
        useSsl = json['useSsl'],
        streamingPort = json['streamingPort'],
        id = json['id'];

  @override
  Map<String, dynamic> toJson() => {
        'transcodingPort': transcodingPort,
        'transcoding': transcoding,
        'streaming': streaming,
        'name': name,
        'username': username,
        'password': password,
        'enigma': enigma.value,
        'address': address,
        'httpPort': httpPort,
        'useSsl': useSsl,
        'streamingPort': streamingPort,
        'id': id,
      };
}
