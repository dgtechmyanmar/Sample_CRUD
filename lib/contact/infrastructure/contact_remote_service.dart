import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_sample_crud/core/config/app_strings.dart';
import 'package:flutter_sample_crud/core/domain/response_info_error.dart';
import 'package:flutter_sample_crud/core/infrastructure/dio_extensions.dart';
import 'package:flutter_sample_crud/core/application/network_result.dart';
import 'package:flutter_sample_crud/contact/domain/contact.dart';

class ContactRemoteService {
  final Dio _dio;
  ContactRemoteService(this._dio);

  Future<Either<ResponseInfoError, NetworkResult<List<Contact>>>>
      getContacts() async {
    try {
      final response = await _dio.get('/');
      var resData = response.data as List;
      if (response.statusCode == AppStrings.statusCode) {
        var jsonData = resData.map((e) => Contact.fromJson(e)).toList();
        // print(jsonData);
        return right(NetworkResult.result(jsonData));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  Future<Either<ResponseInfoError, NetworkResult<String>>> addContact(
      String name, String phone) async {
    final body = {
      "createdAt": DateTime.now().toString(),
      "name": name,
      "phone": phone,
      "id": ''
    };
    try {
      final response = await _dio.post('/', data: body);
      print('addContact / $response');
      print('addContact / ${response.statusCode}');
      print('addContact / ${response.statusMessage}');
      if (response.statusCode == AppStrings.createCode) {
        return right(NetworkResult.result(response.statusMessage.toString()));
      } else {
        return left(ResponseInfoError(
            code: response.statusCode.toString(),
            message: response.statusMessage));
      }
    } on DioError catch (e) {
      if (e.isNoConnectionError) {
        return right(const NetworkResult.noConnection());
      } else if (e.error != null) {
        return left(ResponseInfoError(
            code: e.response?.statusCode.toString(),
            message: e.response?.statusMessage));
      } else {
        rethrow;
      }
    }
  }

  // Future<NetworkResult<List<Contact>>> getContacts2() async {
  //   try {
  //     final response = await _dio.get('/');
  //     var resData = response.data as List;
  //     if (response.statusCode == AppStrings.statusCode) {
  //       var jsonData = resData.map((e) => Contact.fromJson(e)).toList();
  //       // print(jsonData);
  //       return NetworkResult.result(jsonData);
  //     } else {
  //       throw ApiException(
  //           code: response.statusCode, message: response.statusMessage);
  //     }
  //   } on DioError catch (e) {
  //     if (e.isNoConnectionError) {
  //       return const NetworkResult.noConnection();
  //     } else if (e.error != null) {
  //       throw ApiException(
  //           code: e.response?.statusCode, message: e.response?.statusMessage);
  //     } else {
  //       rethrow;
  //     }
  //   }
  // }

  // Future<void> getContactsTest() async {
  //   final response = await _dio.get('/');
  //   print(response.statusCode);
  //   print(response.statusMessage);
  //   print(response.data);
  // }
}

// import 'package:dio/dio.dart';
// import 'package:moesatyae/core/feat_core.dart';

// import '../../../../flavors.dart';
// import '../../feat_way_sale.dart';

// class WaySaleRemoteService {
//   final Dio _dio;
//   static const String tag = 'GetCarScheduleRemoteService';
//   WaySaleRemoteService(this._dio);

//   Future<NetworkResult<List<WaySaleDto>>> getWaySales(
//       String waySaleDate, String createdBy) async {
//     final payload = {
//       "waySaleDate": waySaleDate,
//       "createdBy": createdBy,
//       "sign": F.signKey,
//     };

//     try {
//       final response = await _dio.post(
//         ApiConsts.enpoints.getWaySale,
//         data: payload,
//       );

//       if (response.statusCode == 200) {
//         final data = (response.data as String).xmlToJson;
//         final resInfo =
//             ResponseInfo.fromJson(nextDecode(data, ApiConsts.responseInfo));
//         if (resInfo.code == ApiConsts.status.ok) {
//           final resData =
//               nextDecode(data, ApiConsts.responseData) as List<dynamic>;
//           final convertedDataDto =
//               resData.map((e) => WaySaleDto.fromJson(e)).toList();
//           return NetworkResult.result(convertedDataDto);
//         } else {
//           throw SoapApiException(resInfo.code.intValue, resInfo.message);
//         }
//       } else {
//         throw SoapApiException(response.statusCode, response.statusMessage);
//       }
//     } on DioError catch (e) {
//       if (e.isNoConnectionError) {
//         return const NetworkResult.noConnection();
//       } else if (e.error != null) {
//         throw SoapApiException(
//             e.response?.statusCode, e.response?.statusMessage);
//       } else {
//         rethrow;
//       }
//     }
//   }
// }
