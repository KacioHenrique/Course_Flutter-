class Contact {
  final String name;
  final int accountNumber;

  Contact(this.name, this.accountNumber);

  Contact.fromJson(Map<String, dynamic> json):
      name = json['name'],
      accountNumber = json['accountNumber'];

  @override
  String toString() {
    return "$name $accountNumber";
  }

  Map<String, dynamic> toMap() {
    return {
      'accountNumber': accountNumber,
      'name': name
    };
  }
}

class TransactionFeed {
  final String id;
  final double value;
  final Contact contact;
  TransactionFeed(this.id, this.value, this.contact);

  TransactionFeed.fromJson(Map<String, dynamic> json):
      id = json['id'],
      value = json['value'],
      contact = Contact.fromJson(json['contact']);

  @override
  String toString() {
    return "$id $value " + contact.toString();
  }
}


