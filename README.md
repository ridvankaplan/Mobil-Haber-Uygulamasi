# Haber-Uygulamasi
 
Bölümümüzde 3.Sınıf derslerinden yazılım laboratuvarı 2 dersinin 2. projesidir.
<br/> <br/>
**Not: Mobil geliştiricisi değilim. Sadece ödev verildiği için kısa bir zaman içerisinde bilgi sahibi olunup proje yapılmıştır. Birçok bug, mantık dışı problemler çıkabilir.**
<br/> <br/>
**React-Native** ile geliştirilmiştir. Ödevin içeriği pdf dosyasında bulunmaktadır. Kısaca istenilen, mobil haber uygulaması geliştirilmesidir. API tarafında hazır bir teknoloji (Firebase vs.) kullanılmasına izin verilmediği için api kısmı php ile yazılmıştır. Server tarafında yetkili kişi haber ekleme yapabilmeli ve eklediğinde anında mobil tarafına bildirim gitmelidir. Mobil tarafta ise kullanıcı tüm haberleri listeleyebilir, istediği haberi görüntüleyebilir, kategorilere göre filtreleyebilir, haberlere iyi veya kötü olarak oy verebilir gibi isterleri bulunmaktadır.
<br/> <br/>
## Kurulum

### Veritabanı

Phpmyadmin'e **admin_paneli.sql** dosyasını import edin. 

### Server
**Web Servis ve Haber Ekleme Kismi** dosyasını **xampp** ile veya farklı bir şekilde ayağa kaldırın.

### Mobil
Örnek bir react-native projesi çalıştırın. Örnek olarak kurulum https://facebook.github.io/react-native/docs/getting-started.html <br/><br/>
Ardından **Mobil Kismi** dosyasını indirin ve komut satırında o dizine gelerek aşağıdaki kodu çalıştırın.
```js
react-native run-android
```
**Not: İlgili yerlerdeki IP adreslerini değiştirmeyi unutmayın.** <br/> <br/>
## Örnek
**Server tarafında basit haber ekleme kısmı:**

![](Demo/haberEkle.png)


**Mobil kısmından örnek:**

![](Demo/mobil.gif)

## Lisans
[MIT](https://github.com/ridvankaplan/Haber-Uygulamasi/blob/master/LICENSE)
