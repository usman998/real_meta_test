


import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart'as http;
import 'package:realmeta_test/model/response_model.dart';




class HttpRequestClient{

  HttpRequestClient._internalConstructor();

  static final HttpRequestClient _instance = HttpRequestClient._internalConstructor();

  factory HttpRequestClient(){
    return _instance;
  }

  static const int _kSecondsTimeout = 30;

  Future<ResponseModel> getRequestWithOutHeader({required String url}) async {
    try {
      http.Response response =
      await http.get(Uri.parse(url)).timeout(const Duration(seconds: _kSecondsTimeout));
      ResponseModel responseModel = ResponseModel();
      if (response.body != null && response.body.length > 4) {
        responseModel.statusCode = response.statusCode;
        responseModel.statusDescription = "Success";
        responseModel.data = response.body.startsWith('{') || response.body.startsWith('[') ? jsonDecode(response.body) : response.body;
      }
      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    } catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> getRequestWithRequestBody({required String url,dynamic requestBody}) async {
    try {
      Map<String, String> requestHeader=await getRequestHeader();
      final uri = Uri.parse(url);
      final uriWithBody = uri.replace(queryParameters: requestBody);
      http.Response response =
      await http.get(uriWithBody,headers: requestHeader).timeout(const Duration(seconds: _kSecondsTimeout));
      ResponseModel responseModel = ResponseModel();
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = response.body.startsWith('{') || response.body.startsWith('[') ? jsonDecode(response.body) : response.body;
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
      }
      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    } catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> postRequest({required String url,dynamic requestBody,bool isTokenRequired=false,dynamic requestHeader})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String,String> header ={};
      if(isTokenRequired){
        header = await getRequestHeader(isBearer: true);
      }
      http.Response response = await http.post(Uri.parse(url),body: requestBody,).timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = response.body.startsWith('{') || response.body.startsWith('[') ? jsonDecode(response.body) : response.body;
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
        responseModel.header=response.headers;
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(response.body));
      }

      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request Time Out", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> uploadImageRequest({required String url,required String filePath})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String,String> header ={};
      header = await getRequestHeader(isBearer: true);
      http.MultipartRequest request = http.MultipartRequest("POST",Uri.parse(url));
      request.files.add(await http.MultipartFile.fromPath("photo", filePath));
      request.headers.addAll(header);
      http.StreamedResponse response = await request.send().timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = await response.stream.bytesToString();
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(await response.stream.bytesToString()));
      }
      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request Time Out", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> patchRequest({required String url,dynamic requestBody,bool isBearerHeaderRequired=false,bool isContentType=true})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String, String> header = {};
      if(isBearerHeaderRequired){
        header = await getRequestHeader(isBearer: true,isContentType: isContentType,);
        // "correction"
      }
      http.Request request = await http.Request('PATCH',Uri.parse(url),);
      request.body = jsonEncode(requestBody);
      request.headers.addAll(header);
      http.StreamedResponse response=await request.send().timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = jsonDecode(await response.stream.bytesToString());
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(await response.stream.bytesToString()));
      }
      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> deleteRequest({required String url,bool isBearerHeaderRequired=false,dynamic requestBody})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String, String> header = {"accept": "application/json"};
      if(isBearerHeaderRequired){
        header = await getRequestHeader(isBearer: true);
      }
      http.Request request = await http.Request('DELETE',Uri.parse(url),);
      request.headers.addAll(header);
      if(requestBody!=null){
        request.body = jsonEncode(requestBody);
      }
      http.StreamedResponse response=await request.send().timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = jsonDecode(await response.stream.bytesToString());
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(await response.stream.bytesToString()));
      }
      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<ResponseModel> customRequest(String requestType,{required String url,bool isBearerHeaderRequired=false,dynamic requestBody})async{
    try{
      ResponseModel responseModel = ResponseModel();
      Map<String, String> header = {};
      if(isBearerHeaderRequired){
        header = await getRequestHeader(isBearer: true);
      }
      http.Request request = await http.Request(requestType,Uri.parse(url),);
      request.headers.addAll(header);
      request.body = json.encode(requestBody);
      http.StreamedResponse response=await request.send().timeout(const Duration(seconds: _kSecondsTimeout));
      if((response.statusCode>=200 && response.statusCode<=230)){
        responseModel.data = jsonDecode(await response.stream.bytesToString());
        responseModel.statusCode=response.statusCode;
        responseModel.statusDescription=response.reasonPhrase??'';
      }else{
        responseModel = ResponseModel.errorFromJson(jsonDecode(await response.stream.bytesToString()));
      }
      return responseModel;
    }
    on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }

  Future<Map<String, String>> getRequestHeader({bool isBearer = true,bool isContentType=true})async{
    Map<String,String> header={
      if(isContentType)'Content-Type': 'application/json'
    };
    return header;
  }

  Future<ResponseModel> uploadVideoRequest({required String uploadUrl,required Uint8List chunkStream,}) async {
    try{
      ResponseModel responseModel = ResponseModel();
      http.StreamedRequest request = http.StreamedRequest("PUT",Uri.parse(uploadUrl));
      request.headers.addAll({
        'Content-Length' : "${chunkStream.length}",
        'Content-Type' : 'video/mp4',
        'content-type': 'application/octet-stream'
      });
      request.sink.add(chunkStream);
      request.sink.close();
      http.StreamedResponse response = await request.send();
      responseModel.statusCode=response.statusCode;
      responseModel.statusDescription=response.reasonPhrase??'';
      responseModel.header =response.headers;
      return responseModel;
    } on TimeoutException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: e.toString()));
    } on SocketException catch (e) {
      return Future.value(ResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: e.toString()));
    }catch(e){
      return Future.value(ResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: e.toString()));
    }
  }


  delReq(String url)async{
    http.delete(Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer sk_DkcrWyswqJUsRdsNMNxHKBytMmNwL',
        'Content-Type': 'application/json',
      },
    ).then((http.Response response) {
      return response.body;
    });
  }

}