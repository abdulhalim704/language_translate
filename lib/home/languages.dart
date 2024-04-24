import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override

  Map<String, Map<String, String>> get keys => {

    // English
    'en_US' : {
      'name' : 'What is your name?',
      'login' : 'Do you want to login?',
      'hi' : 'Hi'
    },
    //Urdu
    'ur_PK' : {
      'name' : 'آپ کا نام کیا ہے؟',
      'login' : 'کیا آپ لاگ ان کرنا چاہتے ہیں؟',
      'hi' : 'ہیلو'
    },

    //chiness

    'zh_CN' : {
      'name' : '姓名',
      'login' : '登入',
      'hi' : '你好'
    }


  };
}