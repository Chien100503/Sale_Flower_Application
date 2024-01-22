
class Cart {
  String? _userId;
  String? _title;
  String? _description;
  String? _image;
  String? _price;
  String? _sId;

  Cart(
      {String? userId,
        String? title,
        String? description,
        String? image,
        String? price,
        String? sId}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (image != null) {
      this._image = image;
    }
    if (price != null) {
      this._price = price;
    }
    if (sId != null) {
      this._sId = sId;
    }
  }

  String? get userId => _userId;

  set userId(String? userId) => _userId = userId;

  String? get title => _title;

  set title(String? title) => _title = title;

  String? get description => _description;

  set description(String? description) => _description = description;

  String? get image => _image;

  set image(String? image) => _image = image;

  String? get price => _price;

  set price(String? price) => _price = price;

  String? get sId => _sId;

  set sId(String? sId) => _sId = sId;

  Cart.fromMap(Map<String, dynamic> res) {

    _userId = res['UserId'];
    _title = res['title'];
    _description = res['description'];
    _image = res['image'];
    _price = res['price'];
    _sId = res['_id'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this._userId;
    data['title'] = this._title;
    data['description'] = this._description;
    data['image'] = this._image;
    data['price'] = this._price;
    data['_id'] = this._sId;
    return data;
  }
}