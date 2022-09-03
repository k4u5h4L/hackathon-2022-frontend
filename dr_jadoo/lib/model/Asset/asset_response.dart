class AssetResponse {
  int? _id;
  CreatedBy? _createdBy;
  CreatedBy? _updateBy;
  CreatedBy? _assignedTo;
  CreatedBy? _approvedBy;
  AssignedAsset? _assignedAsset;
  String? _assignedDate;
  String? _assetStatus;
  String? _createdAt;
  String? _updateAt;

  AssetResponse(
      {int? id,
      CreatedBy? createdBy,
      CreatedBy? updateBy,
      CreatedBy? assignedTo,
      CreatedBy? approvedBy,
      AssignedAsset? assignedAsset,
      String? assignedDate,
      String? assetStatus,
      String? createdAt,
      String? updateAt}) {
    if (id != null) {
      this._id = id;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updateBy != null) {
      this._updateBy = updateBy;
    }
    if (assignedTo != null) {
      this._assignedTo = assignedTo;
    }
    if (approvedBy != null) {
      this._approvedBy = approvedBy;
    }
    if (assignedAsset != null) {
      this._assignedAsset = assignedAsset;
    }
    if (assignedDate != null) {
      this._assignedDate = assignedDate;
    }
    if (assetStatus != null) {
      this._assetStatus = assetStatus;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updateAt != null) {
      this._updateAt = updateAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  CreatedBy? get createdBy => _createdBy;
  set createdBy(CreatedBy? createdBy) => _createdBy = createdBy;
  CreatedBy? get updateBy => _updateBy;
  set updateBy(CreatedBy? updateBy) => _updateBy = updateBy;
  CreatedBy? get assignedTo => _assignedTo;
  set assignedTo(CreatedBy? assignedTo) => _assignedTo = assignedTo;
  CreatedBy? get approvedBy => _approvedBy;
  set approvedBy(CreatedBy? approvedBy) => _approvedBy = approvedBy;
  AssignedAsset? get assignedAsset => _assignedAsset;
  set assignedAsset(AssignedAsset? assignedAsset) =>
      _assignedAsset = assignedAsset;
  String? get assignedDate => _assignedDate;
  set assignedDate(String? assignedDate) => _assignedDate = assignedDate;
  String? get assetStatus => _assetStatus;
  set assetStatus(String? assetStatus) => _assetStatus = assetStatus;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updateAt => _updateAt;
  set updateAt(String? updateAt) => _updateAt = updateAt;

  AssetResponse.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    _updateBy = json['update_by'] != null
        ? new CreatedBy.fromJson(json['update_by'])
        : null;
    _assignedTo = json['assigned_to'] != null
        ? new CreatedBy.fromJson(json['assigned_to'])
        : null;
    _approvedBy = json['approved_by'] != null
        ? new CreatedBy.fromJson(json['approved_by'])
        : null;
    _assignedAsset = json['assigned_asset'] != null
        ? new AssignedAsset.fromJson(json['assigned_asset'])
        : null;
    _assignedDate = json['assigned_date'];
    _assetStatus = json['asset_status'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._createdBy != null) {
      data['created_by'] = this._createdBy!.toJson();
    }
    if (this._updateBy != null) {
      data['update_by'] = this._updateBy!.toJson();
    }
    if (this._assignedTo != null) {
      data['assigned_to'] = this._assignedTo!.toJson();
    }
    if (this._approvedBy != null) {
      data['approved_by'] = this._approvedBy!.toJson();
    }
    if (this._assignedAsset != null) {
      data['assigned_asset'] = this._assignedAsset!.toJson();
    }
    data['assigned_date'] = this._assignedDate;
    data['asset_status'] = this._assetStatus;
    data['created_at'] = this._createdAt;
    data['update_at'] = this._updateAt;
    return data;
  }
}

class CreatedBy {
  String? _username;
  String? _email;
  String? _about;
  List<Groups>? _groups;
  String? _designation;
  bool? _isStaff;
  bool? _isActive;
  String? _startDate;

  CreatedBy(
      {String? username,
      String? email,
      String? about,
      List<Groups>? groups,
      String? designation,
      bool? isStaff,
      bool? isActive,
      String? startDate}) {
    if (username != null) {
      this._username = username;
    }
    if (email != null) {
      this._email = email;
    }
    if (about != null) {
      this._about = about;
    }
    if (groups != null) {
      this._groups = groups;
    }
    if (designation != null) {
      this._designation = designation;
    }
    if (isStaff != null) {
      this._isStaff = isStaff;
    }
    if (isActive != null) {
      this._isActive = isActive;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
  }

  String? get username => _username;
  set username(String? username) => _username = username;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get about => _about;
  set about(String? about) => _about = about;
  List<Groups>? get groups => _groups;
  set groups(List<Groups>? groups) => _groups = groups;
  String? get designation => _designation;
  set designation(String? designation) => _designation = designation;
  bool? get isStaff => _isStaff;
  set isStaff(bool? isStaff) => _isStaff = isStaff;
  bool? get isActive => _isActive;
  set isActive(bool? isActive) => _isActive = isActive;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;

  CreatedBy.fromJson(Map<String, dynamic> json) {
    _username = json['username'];
    _email = json['email'];
    _about = json['about'];
    if (json['groups'] != null) {
      _groups = <Groups>[];
      json['groups'].forEach((v) {
        _groups!.add(new Groups.fromJson(v));
      });
    }
    _designation = json['designation'];
    _isStaff = json['is_staff'];
    _isActive = json['is_active'];
    _startDate = json['start_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this._username;
    data['email'] = this._email;
    data['about'] = this._about;
    if (this._groups != null) {
      data['groups'] = this._groups!.map((v) => v.toJson()).toList();
    }
    data['designation'] = this._designation;
    data['is_staff'] = this._isStaff;
    data['is_active'] = this._isActive;
    data['start_date'] = this._startDate;
    return data;
  }
}

class Groups {
  int? _id;
  String? _name;
  List<int>? _permissions;

  Groups({int? id, String? name, List<int>? permissions}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (permissions != null) {
      this._permissions = permissions;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  List<int>? get permissions => _permissions;
  set permissions(List<int>? permissions) => _permissions = permissions;

  Groups.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _permissions = json['permissions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['permissions'] = this._permissions;
    return data;
  }
}

class AssignedAsset {
  int? _id;
  CreatedBy? _createdBy;
  CreatedBy? _updateBy;
  String? _name;
  String? _serialNumber;
  String? _model;
  int? _amount;
  String? _category;
  String? _categoryType;
  String? _purchaseDate;
  String? _manufacturedDate;
  String? _createdAt;
  String? _updateAt;

  AssignedAsset(
      {int? id,
      CreatedBy? createdBy,
      CreatedBy? updateBy,
      String? name,
      String? serialNumber,
      String? model,
      int? amount,
      String? category,
      String? categoryType,
      String? purchaseDate,
      String? manufacturedDate,
      String? createdAt,
      String? updateAt}) {
    if (id != null) {
      this._id = id;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (updateBy != null) {
      this._updateBy = updateBy;
    }
    if (name != null) {
      this._name = name;
    }
    if (serialNumber != null) {
      this._serialNumber = serialNumber;
    }
    if (model != null) {
      this._model = model;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (category != null) {
      this._category = category;
    }
    if (categoryType != null) {
      this._categoryType = categoryType;
    }
    if (purchaseDate != null) {
      this._purchaseDate = purchaseDate;
    }
    if (manufacturedDate != null) {
      this._manufacturedDate = manufacturedDate;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updateAt != null) {
      this._updateAt = updateAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  CreatedBy? get createdBy => _createdBy;
  set createdBy(CreatedBy? createdBy) => _createdBy = createdBy;
  CreatedBy? get updateBy => _updateBy;
  set updateBy(CreatedBy? updateBy) => _updateBy = updateBy;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get serialNumber => _serialNumber;
  set serialNumber(String? serialNumber) => _serialNumber = serialNumber;
  String? get model => _model;
  set model(String? model) => _model = model;
  int? get amount => _amount;
  set amount(int? amount) => _amount = amount;
  String? get category => _category;
  set category(String? category) => _category = category;
  String? get categoryType => _categoryType;
  set categoryType(String? categoryType) => _categoryType = categoryType;
  String? get purchaseDate => _purchaseDate;
  set purchaseDate(String? purchaseDate) => _purchaseDate = purchaseDate;
  String? get manufacturedDate => _manufacturedDate;
  set manufacturedDate(String? manufacturedDate) =>
      _manufacturedDate = manufacturedDate;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updateAt => _updateAt;
  set updateAt(String? updateAt) => _updateAt = updateAt;

  AssignedAsset.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    _updateBy = json['update_by'] != null
        ? new CreatedBy.fromJson(json['update_by'])
        : null;
    _name = json['name'];
    _serialNumber = json['serial_number'];
    _model = json['model'];
    _amount = json['amount'];
    _category = json['category'];
    _categoryType = json['category_type'];
    _purchaseDate = json['purchase_date'];
    _manufacturedDate = json['manufactured_date'];
    _createdAt = json['created_at'];
    _updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._createdBy != null) {
      data['created_by'] = this._createdBy!.toJson();
    }
    if (this._updateBy != null) {
      data['update_by'] = this._updateBy!.toJson();
    }
    data['name'] = this._name;
    data['serial_number'] = this._serialNumber;
    data['model'] = this._model;
    data['amount'] = this._amount;
    data['category'] = this._category;
    data['category_type'] = this._categoryType;
    data['purchase_date'] = this._purchaseDate;
    data['manufactured_date'] = this._manufacturedDate;
    data['created_at'] = this._createdAt;
    data['update_at'] = this._updateAt;
    return data;
  }
}