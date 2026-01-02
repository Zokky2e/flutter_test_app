class ProductModelOutput {
  final double _price;
  final int _workingHours;
  ProductModelOutput(this._price, this._workingHours);
  factory ProductModelOutput.fromJson(Map<String, dynamic> json) {
    return ProductModelOutput(
      (json['price'] as num).toDouble(),
      (json['working_hours'] as num).toInt(),
    );
  }
  double get price => _price;
  int get workingHours => _workingHours;
}
