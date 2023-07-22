import 'package:MyCareer/core/class/statusRequesr.class.dart';

handleingReposnr(Response) async {
  if (Response is statusRequest) {
    return Response;
  } else {
    return statusRequest.success;
  }
}
