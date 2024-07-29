class Messages {
  final String id;
  final String senderId;
  final String text;
  final String timeStamp;

  Messages({
    required this.id,
    required this.senderId,
    required this.text,
    required this.timeStamp,
  });

  factory Messages.fromJson(Map<String, dynamic> json) {
    return Messages(
        id: json['id'],
        senderId: json['senderId'],
        text: json['text'],
        timeStamp: json['timeStamp']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'senderId': senderId,
      'text' : text,
      'timestamp' : timeStamp.toString()
    };
  }
}
