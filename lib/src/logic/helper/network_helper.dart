import 'dart:convert';
import 'package:engagementwallet/src/logic/exceptions/api_failure_exception.dart';
import 'package:engagementwallet/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


/// Helper class to make http request

uriConverter(String url) {
  return Uri.https(kUrl, url);
}

uriConverterWithQuery(String url, Map<String, dynamic> params) {
  return Uri.https(kUrl, url, params);
}

class NetworkHelper {
  //Login example
  Future<dynamic> loginUser(
      String email, String password, BuildContext context) async {
    var body = {
      "userName": email,
      "password": password,
    };

    return await postRequest(body: body, url: 'api/auth/login');
  }

  //Update Customer Profile
  Future<dynamic> updateCustomerProfile(
      String email, String firstName, String lastName,String phone,String password, String userId, String image, BuildContext context) async {
    var body = {
      "emailAddress": email,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phone,
      "password": password,
      "userId": userId,
      // "profileImage": base64Image
      "profileImage": 'data:image/png;base64,$image'
    };

    print('body: $body');
    return await patchRequest('api/auth/update-customer-profile', body);
  }


  //verifyCustomerOtp example
  Future<dynamic> startCustomerVerification(String phoneNumber, String verificationPurpose) async {
    var params = {
      "phoneOrEmail": '+234${phoneNumber}',
      "verificationPurpose":verificationPurpose
    };

    return await postParamRequest('api/auth/start-customer-verification', params);
  }

  //verifyCustomerOtp example
  Future<dynamic> verifyCustomerOtp(String phoneNumber, String code, String verificationPurpose) async {
    var params = {
      "phoneOrEmail": '+234${phoneNumber}',
      "code": code,
      "verificationPurpose":verificationPurpose
    };

    return await postParamRequest('api/auth/verify-customer-otp-code', params);
  }

  //Verify Otp
  Future<dynamic> logout( String token) async {
    return await putRequest('api/auth/logout', null, token);
  }


  //Forgot Password
  Future<dynamic> forgotPassword(String email) async {
    var params = {"mode": "customer", "email": email.toLowerCase()};

    return await putParamRequest('api/auth/resend_otp_anon', params);
  }

  //Forgot Password
  Future<dynamic> changePassword(
      String otp, String email, String password) async {
    var body = {
      "email": email.toLowerCase(),
      "phoneNumber":"",
      "otp": otp,
      "password": password,
      "mode": "customer"
    };
    return await putRequest('api/auth/reset_password', body);
  }

  Future<dynamic> createPin(
      String pin, ) async {
    var body = {
      "pin": pin,

    };
    return await postRequest(url: 'api/auth/create-pin', body: body, token: null);
  }


  //Verify Otp
  Future<dynamic> verifyOTP(String otp, String token) async {
    var body = {"otp": otp};
    return await putRequest('api/auth/verify', body, token);
  }

  //Sign Up Resend otp
  Future<dynamic> sendOTP(String token) async {
    var params = {"mode": "customer"};

    return await putParamRequest('api/auth/resend_otp', params, token);
  }

  //Forgot Password
  Future<dynamic> sendOTPAnon(String email) async {
    var params = {"mode": "customer","email":email};

    return await putParamRequest('api/auth/resend_otp_anon', params, "");
  }

  ///Get User
  Future<dynamic> getUser(String? token) async {
    return await getRequest(url: 'customer/profile', token: token);
  }

  ///Edit User Profile
  Future<dynamic> editProfile(String token, String firstName, String lastName, String phoneNumber,String profilePicture, int age,String gender) async {
    Map<String,dynamic> body = {
      "firstName": firstName,
      "lastName":lastName,
      "phoneNumber": phoneNumber,
      "profileImage": profilePicture,
      "age": age.toString(),
      "gender":  gender.toLowerCase()
    };


    print('body: $body');

    return await putRequest('customer/profile',body, token);
  }

  ///Get Ongoing Courses
  Future<dynamic> fetchOngoingCourse(String? token) async {
    return await getRequest(url: 'customer/course/ongoing', token: token);
  }

  ///Get Mostly Viewed Courses
  Future<dynamic> fetchMostlyViewedCourses(String? token) async {
    return await getRequest(url: 'course/most-viewed', token: token);
  }

  ///Get Customer Courses
  Future<dynamic> fetchCustomerCourses(String? token, String? param) async {
    var params = {"query": param ?? ''};

    return await getParamRequest(url: 'customer/course', params: params, token: token!);
  }

  ///Get Customer Courses with Id
  Future<dynamic> fetchCustomerCoursesId(String? token,String id) async {
    return await getRequest(url: 'customer/course/$id', token: token);
  }

  //Get Free Courses
  Future<dynamic> getFreeCourses(String? token) async {
    var params = {"free": "true"};
    return await getParamRequest(url: 'customer/session', params: params, token: token!);
  }


//Watch Free Courses
  Future<dynamic> watchFreeCourses(String? token, String? lessonId) async {
    return await getRequest(
        url: 'customer/course/session/$lessonId/join', token: token);
  }

  //Buy Course
  Future<dynamic> applyVoucher(
      String courseId, String? discountId ,String token) async {
    var params = {"courseId": courseId};

    return await getParamRequest(url: 'customer/discount/course/find/$discountId',
        params: params, token: token);
  }

  //Buy Course
  Future<dynamic> buyCourse(
      String courseId, String? discountId ,String token) async {
    var body = {"discountCode": discountId ?? ''};

    return await putRequest('customer/course/$courseId/buy',body, token);
  }


  //Own Course
  Future<dynamic> ownCourse(String courseId,String token) async {
    return await getRequest(url: 'course/$courseId/own', token: token);

  }

  //Get Free Courses
  Future<dynamic> getExploreCategories() async {
    return await getRequest(url: 'course/category',token: "");
  }

  //Get Free Courses
  Future<dynamic> getNotifications(String token) async {
    return await getRequest(url: 'notification',token: token);
  }

  Future<dynamic> getExploreCourses(String key) async {
    var params = {"key": "$key"};
    return await getParamRequest(url: 'course', params: params, token: '',);
  }
  //GET POST PUT
  Future<dynamic> getParamRequest(
      {String? url,
        Map<String, dynamic>? params,
        required String token,
        BuildContext? context}) async {
    var response = await http.get(uriConverterWithQuery(url!, params!),
        headers: kHeaders(token));
    print('urlll: ${uriConverterWithQuery(url, params)}');
    print(response.body);
    var decoded = jsonDecode(response.body);
    print(response.headers);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      throw ApiFailureException(decoded['message']);
    }
  }

  Future<dynamic> postParamRequest(String? url, Map<String, dynamic>? params,
      [String? token, Map? body]) async {
    print('urlll:${uriConverterWithQuery(url!, params!)}');
    var response = await http.post(uriConverterWithQuery(url, params),
        headers: kHeaders(token ?? null),
        body: body != null ? json.encode(body) : null);
    var decoded = jsonDecode(response.body);
    print(response.headers);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      if(decoded['message'].s)
        throw ApiFailureException();
    }
  }

  Future<dynamic> putParamRequest(String? url, Map<String, dynamic>? params,
      [String? token, Map? body]) async {
    print('urlll:${uriConverterWithQuery(url!, params!)}');
    var response = await http.put(uriConverterWithQuery(url, params),
        headers: kHeaders(token ?? null),
        body: body != null ? json.encode(body) : null);
    var decoded = jsonDecode(response.body);
    print(response.headers);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      if(decoded['message'].s)
        throw ApiFailureException();
    }
  }


  Future<dynamic> getRequest({String? url, String? token}) async {
    // print('courseID:${courseId}');
    print('url: ${uriConverter(url!)}');
    print('token: ${token}');
    var response = await http.get(uriConverter(url), headers: kHeaders(token));
    print('response-body: ${response.body}');
    var decoded = jsonDecode(response.body);
    print(response.headers);
    print(response.statusCode);
    if (response.statusCode.toString().startsWith('2')) {
      return decoded;
    } else {
      throw ApiFailureException(decoded['message']);
    }
  }

  Future<dynamic> putRequest(String? url, [Map? body, dynamic token]) async {

    var response = await http.put(uriConverter(url!),
        body: json.encode(body ?? null), headers: kHeaders(token ?? null));
    var decoded = jsonDecode(response.body);
    print('decode:${response.statusCode}');
    if (response.statusCode.toString().startsWith('2')) {
      print('decode:$decoded');
      return decoded;
    } else {
      print('decode:${response.body }');
      debugPrint(
          'reason is ${response.reasonPhrase} message is ${decoded['message']}');
      throw ApiFailureException(decoded['message']);
    }
  }

Future<dynamic> patchRequest(String? url, [Map? body, dynamic token]) async {
print('url: ${uriConverter(url!)}');
  var response = await http.patch(uriConverter(url),
      body: json.encode(body ?? null), headers: kHeaders(token ?? null));
  var decoded = jsonDecode(response.body);
  print('decode:${response.statusCode}');
  if (response.statusCode.toString().startsWith('2')) {
    print('decode:$decoded');
    return decoded;
  } else {
    print('decode:${response.body }');
    debugPrint(
        'reason is ${response.reasonPhrase} message is ${decoded['message']}');
    throw ApiFailureException(decoded['message']);
  }
}

  Future<dynamic>  postRequest({Map? body, required String url, String? token,}) async {
    print('decoded: ${uriConverter(url)}');
    print('decoded: ${body}');

    var response = await http.post(
        uriConverter(url),
        headers: kHeaders(token ?? null),
        body: json.encode(body ?? null)
    );
    print('Status code: ${response.statusCode}');

    var decoded = jsonDecode(response.body);
    if (response.statusCode.toString().startsWith('2')) {
      print('decoded: $decoded');

      return decoded;


    } else {

      debugPrint(
          'reason is ${response.reasonPhrase} message is ${decoded['message']}');
      throw ApiFailureException(decoded['message']);

    }
  }
}
