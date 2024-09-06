class ContactModel {
  String vector;
  bool isSelected;
  ContactModel({
    required this.vector,
    required this.isSelected,
  });

  static List<ContactModel> getContacts() {
    List<ContactModel> contacts = [];

    contacts.add(ContactModel(
        vector: 'assets/vectors/icone-wpp.svg', isSelected: false));

    contacts.add(ContactModel(
        vector: 'assets/vectors/icone-linkedin.svg', isSelected: false));

    contacts.add(ContactModel(
        vector: 'assets/vectors/icone-spotify.svg', isSelected: false));

    contacts.add(ContactModel(
        vector: 'assets/vectors/icone-github.svg', isSelected: false));

    return contacts;
  }
}
