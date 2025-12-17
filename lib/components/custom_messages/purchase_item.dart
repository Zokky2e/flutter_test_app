class PurchaseItem {
  final int _id;
  final String _name;
  final double _price;
  final String _imageUrl;
  final String _dateAdded;
  PurchaseItem(
    this._id,
    this._name,
    this._price,
    this._imageUrl,
    this._dateAdded,
  );

  int get id => _id;
  String get name => _name;
  double get price => _price;
  String get imageUrl => _imageUrl;
  String get dateAdded => _dateAdded;
}
