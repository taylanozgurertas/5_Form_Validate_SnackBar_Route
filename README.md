#

MaterialApp içerisinde routes diye bir özellik var 
routes: {
"/": (context)=> Home(),
"/sayfa2": (context)=> Sayfa2(),

}, //string ve karşılığında gideceği yer şeklinde

routes özelliği ilk olarak / ı çalıştırır ana sayfa olarak. biz de o yüzden yaptığımız ana sayfayı oraya veririz
routes özelliği ile aynı anda home: özelliği kullanılamıyor zaten mantıken de kullanılması saçma

Form widgetı önemli
textfield lar üzerinde işlemler yapmak için önemli bir widget. 

Textfieldları veriyoruz bizim aslında istediğimiz şey şu 

iki textfield olacak bir şeyler yazacağız işte butona basacağız doğru mu çalışıyor vs nasıl çalışıyor bu form mantığını
inceleyeceğiz.