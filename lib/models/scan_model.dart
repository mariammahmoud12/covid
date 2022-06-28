class ScanModel {
  String? status;
  String? url;
  String? result;

  ScanModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    url = json['url'];
    result = json['vgg_chest_pred'];

  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'url': url,
      'vgg_chest_pred': result,
    };
  }
}
