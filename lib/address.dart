class Address {
  String name = '';
  String street = '';
  String zip = '';
  String city = '';

  Address();

  Address.withName(this.name);

  @override
  String toString() {
    return 'Address{name: $name, street: $street, zip: $zip, city: $city}';
  }


}