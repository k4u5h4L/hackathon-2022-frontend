import 'package:dr_jadoo/core/rest_client.dart';
import 'package:dr_jadoo/model/Asset/asset_create.dart';
import 'package:dr_jadoo/model/Asset/asset_response.dart';
import 'package:dr_jadoo/model/error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

class AssetService {
  static AssetService? _instance;

  static AssetService get instance {
    _instance ??= AssetService();
    return _instance!;
  }

  Future<List<AssetResponse>> getCurrentOwnedAsset() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response = await restClient.get(
        '${EnvConstants.host}/api/assets-assigned/list',
        headers: <String, String>{
          'Accept': '*/*',
          'Authorization': 'Bearer ${authToken!}'
        });
    if (response is Error) {
      return [];
    }
    final List<AssetResponse> assets = [];
    assets.add(AssetResponse.fromJson(response[0]));
    assets.add(AssetResponse.fromJson(response[3]));
    return assets;
  }

  Future<List<AssetResponse>> getAllAssets() async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response = await restClient.get(
        '${EnvConstants.host}/api/assets-assigned/list/all',
        headers: <String, String>{
          'Accept': '*/*',
          'Authorization': 'Bearer ${authToken!}'
        });
    if (response is Error) {
      return [];
    }
    final List<AssetResponse> assets = [];
    for (int i = 0; i < response.length; i++) {
      assets.add(AssetResponse.fromJson(response[i]));
    }
    return assets;
  }

  Future<AssetResponse> createAsset(AssetCreate assetCreate) async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response =
        await restClient.post('${EnvConstants.host}/api/assets/create',
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': '*/*',
              'Authorization': 'Bearer ${authToken!}'
            },
            body: assetCreate);
    final AssetResponse assetResponse = AssetResponse.fromJson(response);
    return assetResponse;
  }

  Future<AssetResponse> getAssetDetail(int assetId) async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response = await restClient.get(
        '${EnvConstants.host}/api/assets/${assetId.toString()}',
        headers: <String, String>{
          'Content-type': 'application/json',
          'Accept': '*/*',
          'Authorization': 'Bearer ${authToken!}'
    });
    final AssetResponse assetResponse = AssetResponse.fromJson(response);
    return assetResponse;
  }

  Future<AssetResponse> provideAssetFeedback(AssetCreate assetCreate) async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response =
        await restClient.post('${EnvConstants.host}/api/assets/create',
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': '*/*',
              'Authorization': 'Bearer ${authToken!}'
            },
            body: assetCreate);
    final AssetResponse assetResponse = AssetResponse.fromJson(response);
    return assetResponse;
  }

  Future<AssetResponse> requestAsset(AssetCreate assetCreate) async {
    final prefs = await SharedPreferences.getInstance();
    final String? authToken = prefs.getString('token');
    var response =
        await restClient.post('${EnvConstants.host}/api/assets/create',
            headers: <String, String>{
              'Content-type': 'application/json',
              'Accept': '*/*',
              'Authorization': 'Bearer ${authToken!}'
            },
            body: assetCreate);
    final AssetResponse assetResponse = AssetResponse.fromJson(response);
    return assetResponse;
  }
  
}
