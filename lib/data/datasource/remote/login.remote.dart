import 'package:MyCareer/core/class/crud.class.dart';
import 'package:MyCareer/core/constatnt/links.dart';

class loginRemote {
  crud Crud;
  loginRemote(this.Crud);

  postData(String email, String password, bool remember) async {
    var response = await Crud.postData(links.login, {
      "email": email,
      "password": password,
      "remember": remember.toString(),
    });
    print("///////////////////////////////////////");
    print(response);
    return response.fold((l) => l, (r) => r);
  }
}
