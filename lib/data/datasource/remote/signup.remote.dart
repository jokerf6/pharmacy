import 'package:MyCareer/core/class/crud.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';

class signupPost {
  crud Crud;
  signupPost(this.Crud);

  postData(String name, String email, String password, String jobId,
      String cityId, String cv) async {
    var response = await Crud.postData(links.signup, {
      "name": name,
      "email": email,
      "password": password,
      "jobId": jobId,
      "cityId": cityId,
      "cv": cv,
    });

    return response.fold((l) => l, (r) => r);
  }

  verify(String code, String id) async {
    var response = await Crud.postData(links.verify + "/${id}", {
      "code": code,
    });
    return response.fold((l) => l, (r) => r);
  }

  change(String code, String id) async {
    var response = await Crud.postData(links.change + "/${id}", {
      "password": code,
    });
    return response.fold((l) => l, (r) => r);
  }

  forgetEmail(String email) async {
    var response = await Crud.postData(links.forget, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }

  forgetVerify(String code, String id) async {
    var response = await Crud.postData(links.reset + "/${id}", {
      "code": code,
    });
    return response.fold((l) => l, (r) => r);
  }
}

class signupGetCities {
  crud Crud;
  signupGetCities(this.Crud);

  getData() async {
    var response = await Crud.getData(links.cities);
    return response.fold((l) => l, (r) => r);
  }
}

class signupGetjobs {
  crud Crud;
  signupGetjobs(this.Crud);

  getData() async {
    var response = await Crud.getData(links.jobs);
    return response.fold((l) => l, (r) => r);
  }
}

class uploadFile {
  crud Crud;
  uploadFile(this.Crud);

  upload(filePath, fileName) async {
    print("File: ${filePath}");
    var response = await Crud.postData(links.upload, {'file': filePath});
    return response.fold((l) => l, (r) => r);
  }
}
