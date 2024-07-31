class Messages {
  final String id;
  final String senderId;
  final String text;
  final String timeStamp;
  final int type;

  Messages({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timeStamp,
    required this.type,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
        id: json['id'],
        senderId: json['senderId'],
        text: json['text'],
        timeStamp: json['timeStamp'],
        type: json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'senderId': senderId,
      'text' : text,
      'timestamp' : timeStamp.toString(),
      'type' : type
    };
  }
}
