import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final formKey = GlobalKey<
      FormState>(); //Form widgetı için bir key oluşturduk onu formKey adlı degiskenimize atadık keyimiz artık formKey
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _textFieldUserName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("appbar basligi"),
      ),
      body: Form(
        //form widgetını koyuyoruz önce
        key: formKey, //Form widgetı bizden key bekler biz de keyini verdik.

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textFieldUserName,
              //TextFormFieldı kontrol etmek için gerekli olan copntroller

              decoration: InputDecoration(
                hintText: "username",
                labelText: "username",
              ),

              //TextFormField widgetı Form widgetının içine koyulabilen TextField widgetıdır.
              // bununla validasyon mevzusunu inceleyebiliyoruz
              validator: (val) {
                //validator özelligi var burada validasyonla ilgili kontroller yapabiliyoruz
                if (val!.isEmpty) {
                  //örneğin textfield boşsa have a error diye hata ver dedik
                  return "hata var bir tane";
                } else {
                  return null; //sıkıntı yoksa null döndür dedik
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              validator: (val) {
                if (val!.length < 6) {
                  return "minimum 6 karakter olması lazım";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  border: OutlineInputBorder()),
            ),
            IconButton(
                onPressed: () {
                  formKey.currentState!.reset(); //formKeyin statetini sıfırlar
                  if (formKey.currentState!.validate()) {
                    //formKeyin currentStatei validate se yani sıkıntı yoksa olacaklar
                    print("okey");
                  } else {
                    print("error");
                    //diyelim ki error aldığımızda aşağıdan snackbarla bunu bildirsek?
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("error")));
                    //alttan böyle mesaj gibi göstermeye yarar
                    //scaffoldmessenger diye bir sınıfı kullanıyoruz of yani bu contextten bu sayfadan bir snackbar göster
                  }
                },
                icon: Icon(Icons.check)),
          ],
        ),
      ),
    );
  }

  /*
  dispose() metodu, bir Stateful Widget'in ömrü sona erdiğinde çağrılan bir metottur. Bu metod, widget'ın sahip olduğu kaynakları (bellek, dosya vb.) serbest bırakmak için kullanılır.

Yukarıdaki kod parçasında, formKey.currentState!.dispose() satırı, widget'in sahip olduğu bir formKey nesnesinin mevcut durumunun serbest bırakılmasını sağlar.
 Bu satır, formun bellek kullanımını azaltmak için kullanılır.
 Bu satırı kullanmazsanız, bellek sızıntısı oluşabilir.
super.dispose() satırı ise, State sınıfının dispose() metodunu çağırarak, State nesnesinin kaynaklarını serbest bırakır.

Özetle, dispose() metodu, widget'in sahip olduğu kaynakları serbest bırakmak için kullanılır
ve formKey.currentState!.dispose() satırı, formun bellek kullanımını azaltmak için kullanılır.
Bu satırı kullanarak, formun sahip olduğu kaynakları serbest bırakabilirsiniz.
  */
  @override
  void dispose() {
    formKey.currentState!.dispose();
    scaffoldKey.currentState!.dispose();
    super.dispose();
  }
}
