class Contact extends Encode {
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

  @override
  Map<String, dynamic> encode() {
    return {
      'accountNumber': accountNumber,
      'name': name
    };
  }
}

class TransactionFeed extends Encode {
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

  @override
  Map<String, dynamic> encode() {
    return {
      'id': id,
       'value': value,
        'contact': contact.encode()
    };
  }
}

abstract class Encode {
  Map<String, dynamic> encode();
}