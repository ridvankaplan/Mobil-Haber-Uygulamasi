-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 30 May 2019, 23:14:54
-- Sunucu sürümü: 10.1.38-MariaDB
-- PHP Sürümü: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `admin paneli`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `kullaniciAdi` varchar(1024) COLLATE utf8_turkish_ci NOT NULL,
  `parola` varchar(1024) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`kullaniciAdi`, `parola`) VALUES
('admin', '123456');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `haber`
--

CREATE TABLE `haber` (
  `id` int(11) NOT NULL,
  `Resim` varchar(1024) COLLATE utf8_turkish_ci NOT NULL,
  `Baslik` varchar(1024) COLLATE utf8_turkish_ci NOT NULL,
  `Icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `Tur` varchar(48) COLLATE utf8_turkish_ci NOT NULL,
  `Tarih` varchar(16) COLLATE utf8_turkish_ci NOT NULL,
  `Begenme` int(255) NOT NULL,
  `Begenmeme` int(255) NOT NULL,
  `Goruntulenme` int(255) NOT NULL,
  `ButonKontrol` int(255) NOT NULL,
  `BildirimKontrol` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `haber`
--

INSERT INTO `haber` (`id`, `Resim`, `Baslik`, `Icerik`, `Tur`, `Tarih`, `Begenme`, `Begenmeme`, `Goruntulenme`, `ButonKontrol`, `BildirimKontrol`) VALUES
(1, 'http://i2.haber7.net//haber/haber7/photos/2019/17/super_ligde_istifa_yollar_ayrildi_1556290088_7633.jpg', 'Süper Lig\'de istifa! Yollar ayrıldı...', 'Ziraat Türkiye Kupası Yarı Final rövanş karşılaşmasında oynanan Galatasaray maçı sonrası istifa edeceği sinyallerini veren Erol Bulut, bugün Kulüp yönetimi ile görüşerek görevini bıraktı. 5-2’lik Galatasaray mağlubiyeti sonrası acilen toplanan sarı-kırmızılı yönetim, teknik heyetin durumunu görüşerek karara bağladı. Toplantı sonrası yönetimle karşılıklı anlaşmaya varılarak Erol Bulut’un teknik direktörlük görevinden ayrıldığı öğrenildi.\r\n\r\nSportif Direktör Ali Ravcı, Erol Bulut ile yollarının ayrıldığını doğrulayarak, “Hocamız ile yönetim kurulumuz dünkü Galatasaray maçının ardından görüşerek yolların ayrılması noktasında karşılıklı olarak anlaşmaya vardı. Tabi gelinen süreç, hepimizi derinden üzmektedir. Erol hocamızla ile önemli başarılara imza attık, güzel günler geçirdik. Ama futbolda bu tür ayrılıklar her zaman vardır bundan sonrada da olacaktır. Bu anlamda kendisine kulübümüze verdiği emeklerden dolayı teşekkür ediyoruz. İnşallah alınan bu karar her iki taraf için hayırlı olur” diye konuştu.\r\n\r\nRavcı, ayrıca takımın Kasımpaşa maçına Erol Bulut’un yardımcıları nezaretinde hazırlanacağını ifade etti.', 'Spor', '2019-02-28', 49, 13, 311, 1, 1),
(2, 'http://i2.haber7.net//haber/haber7/photos/2019/17/taksiciler_odasi_baskanindan_gencebaya_ziyaret_1556278828_8587.jpg', 'Taksicilerden Gencebay ailesine özür ziyareti', 'Akabinde sektörümüz adına geçmiş olsun dileklerimizi iletmek üzere hemen dün gece yarısı Gayrettepe’de kaldığı hastaneye gidip kendilerine, kıymetli annesi Sevim Emre’ye geçmiş olsun dileklerimizi ilettik. \r\n\r\nHiç istemediğimiz, tasvip etmediğimiz ve tamamen sektörümüze zarar veren bu olaydan ötürü Kıymetli Gencebay ailesinden özür diledik. Durumunun iyi olması bizi sevindirdi, Allah’tan acil şifalar diliyoruz. \r\n\r\nZiyaretimizde kendilerine de ifade ettiğimiz üzere olayın bizzat takipçisi olacağımızı bildirmek isterim, öte yandan yaşanılan bu olayda, taksi şoförünün daha önceden de sabıkası olduğunu öğrendik. Bu, bizim uzun süredir dile getirdiğimiz denetim eksikliklerini, sektörümüzde standartların bir türlü oluşturulamamış olmasını da tekrar gün yüzüne çıkardı. \r\n\r\nBiz 52 bin çalışandan oluşan bir sektörüz, ancak içimizde maalesef denetim eksiklikleri dolayısıyla bu tür sabıkalı insanlar da kaçak çalışabiliyor. Bunun önüne geçilmesi için hem İçişleri Bakanlığı’nı hem de Emniyet Genel Müdürlüğü’nü işbirliğine davet ediyoruz. Yaşanan elim olaydan dolayı üzüntümüzü tekrar belirtmek isteriz. ', 'Gundem', '2019-04-19', 8, 4, 52, 1, 1),
(3, 'http://i2.haber7.net//haber/haber7/photos/2019/17/taksiciler_odasi_baskanindan_gencebaya_ziyaret_1556278828_8587.jpg', 'Taksicilerden Gencebay ailesine özür ziyareti', 'Akabinde sektörümüz adına geçmiş olsun dileklerimizi iletmek üzere hemen dün gece yarısı Gayrettepe’de kaldığı hastaneye gidip kendilerine, kıymetli annesi Sevim Emre’ye geçmiş olsun dileklerimizi ilettik. \r\n\r\nHiç istemediğimiz, tasvip etmediğimiz ve tamamen sektörümüze zarar veren bu olaydan ötürü Kıymetli Gencebay ailesinden özür diledik. Durumunun iyi olması bizi sevindirdi, Allah’tan acil şifalar diliyoruz. \r\n\r\nZiyaretimizde kendilerine de ifade ettiğimiz üzere olayın bizzat takipçisi olacağımızı bildirmek isterim, öte yandan yaşanılan bu olayda, taksi şoförünün daha önceden de sabıkası olduğunu öğrendik. Bu, bizim uzun süredir dile getirdiğimiz denetim eksikliklerini, sektörümüzde standartların bir türlü oluşturulamamış olmasını da tekrar gün yüzüne çıkardı. \r\n\r\nBiz 52 bin çalışandan oluşan bir sektörüz, ancak içimizde maalesef denetim eksiklikleri dolayısıyla bu tür sabıkalı insanlar da kaçak çalışabiliyor. Bunun önüne geçilmesi için hem İçişleri Bakanlığı’nı hem de Emniyet Genel Müdürlüğü’nü işbirliğine davet ediyoruz. Yaşanan elim olaydan dolayı üzüntümüzü tekrar belirtmek isteriz. ', 'Gundem', '2019-04-16', 4, 5, 31, 0, 1),
(4, 'http://i2.haber7.net//haber/haber7/photos/2019/16/sESDU_1555794300_3744.jpg', 'Kenevir Araştırma Enstitüsü kuruldu', 'Ondokuz Mayıs Üniversitesinin üniversite, şehir ve sanayi iş birliğinin gelişmesini sağlamak amacıyla şehrin önemli aktörlerini bir araya getirdiği “Üniversite Danışma Kurulu Toplantısı”nın beşincisi, Samsun Valisi Osman Kaymak’ın başkanlığında gerçekleşti.\r\n\r\nToplantıda, OMÜ’deki gelişmeler ve mevcut durumun değerlendirilmesinin yanı sıra OMÜ’nün hayata geçirdiği sıfır atık seferberliği, öğretim üyelerinin patent sürecine soktukları çalışmaları ile iş yeri eğitimi süreci konularında bilgilendirme yapıldı. Fikir alışverişi bakımından oldukça verimli geçen toplantıya, danışma kurulu üyeleriyle birlikte Samsun Milletvekili Fuat Köktaş da davetli olarak katıldı.\r\n\r\nBÜTÇEYİ VERİMLİ KULLANMAK İÇİN ÖNCELİKLİ ÇALIŞMA ALANLARI BELİRLEDİK\r\n\r\nÜniversite yönetimi olarak var olan bütçeyi verimli kullanmak için öncelikli çalışma alanları belirlediklerini kaydeden Bilgiç, “AR-GE çalışmalarımızın yüzde 60’ını kendi bütçemizden yüzde 40’ını da projelerle elde ettiğimiz dış kaynaklardan sağlıyoruz. 2018 yılında AR-GE çalışmalarımız için yaklaşık 30 milyon TL bütçe sağladık. Elimizdeki bütçe ile öncelik verdiğimiz çalışma alanları ise iklim değişikli ve etkileri, enerji üretimi, akıllı sistemler, sağlık alanında yenilikçi cihaz ve malzeme modellerinin geliştirilmesi, atık yönetimi, nörobilimler ve endüstriyel tasarım olarak sıralayabiliriz” değerlendirmesinde bulundu.\r\n\r\nEğitim ve öğretim alanında Türkiye’deki ihtiyaca yönelik bölümlerin açılması için Yükseköğretim Kuruluna (YÖK) başvuruda bulunduklarını dile getiren Prof. Dr. Sait Bilgiç bu alandaki gelişmelerle ilgili şunları söyledi: “Veteriner Fakültesi’nin inşası için 30 milyon TL’lik bir ödenek geldi. Acil servisimizin de geliştirilmesi, modern ve güvenli bir şekilde hizmet verebilmesi için hazırladığımız proje de kabul edildi. Yatay gelişmeden çok dikey gelişmeye yönelik yeni açtığımız bölümler ise Sağlık Bilimleri Fakültesinde Odyoloji, Fizik Tedavi ve Rehabiltasyon, Ortez Protez, Dil ve Konuşma Bozuklukları bölümleri, Bafra İşletme Fakültesinde Sigortacılık ve Sosyal Güvenlik Bölümü’dür.”\r\n\r\n3 gün önce Kenevir Araştırmaları Enstitüsünün kurulduğu bilgisini veren Rektör Bilgiç şöyle konuştu: “Cumhurbaşkanımızın da Samsun’un kenevir merkezi olması ile ilgili açıklamaları olmuştu. Bu açıklamanın gereği olarak ve kenevir açısından Samsun’un alt yapı ve potansiyelini de göz önüne alarak en uygun yer olduğunu düşündüğümüz OMÜ’de bu enstitünün hızlı bir şekilde faaliyete başlamasını hedefliyoruz. Çünkü öğretim üyesi bakımından da imkânımız var. Kısacası Samsun’un kenevire bağlı sanayinin merkezi olmasını destekleyecek bir birimimiz oldu. Destek olanlara teşekkür ediyorum.”', 'Egitim', '2019-04-28', 6, 3, 39, 1, 1),
(5, 'http://i2.haber7.net//haber/haber7/photos/2019/01/vida_net_konustu_sezon_sonunda_1546331062_0654.jpg', 'Domagoj Vidaya La Ligadan talip var!', 'Avrupa takımlarının Vidaya ilgisi bitmek bilmiyor. İngiliz ve İtalyan takımlarının ardından İspanyol kulüplerinden Espanyolun da Hırvat futbolcuyu yakın takibe aldığı gelen bilgiler arasında.\r\n\r\nRUBI ONU ÇOK İSTİYOR\r\n\r\nEspanyol Teknik Direktörü Rubinin Naldo ve Hermosonun performansından memnun olmadığı ve yeni sezonda Vidanın alınması için yönetime tavsiye kararında bulunduğu öğrenildi. \r\n\r\nGelecek sezon iddialı bir kadro kurmak için planlar yapan İspanyol kulübünün yöneticilerinin Vidayı sezon sonuna kadar izlemeye devam edeceği ve Mayıs sonunda Beşiktaşın kapısını çalacağı öne sürüldü.\r\n\r\nWOLVERHAMPTON DA PEŞİNDE!\r\n\r\nBu arada İngiliz basını, Rusyadaki Dünya Kupası finalinin ardından Wolverhamptonın transfer etmeye çalıştığı Domagoj Vida için sezon sonu bir kez daha girişimde bulunacağını duyurdu. Kurtların hedefinde 15 milyon euroya Vidayı almak var başlığıyla verilen haberde, Beşkitaşın Hırvat yıldızının bu sezon ortaya koyduğu performansla Premier Lige girme şansını yükselttiği vurgulandı. \r\n\r\nVIDA BİR İSTİKRAR ABİDESİ\r\n\r\nTottenhamla da ismi anılan Vidaya Beşiktaşın 20 milyon euro değer biçtiği, ancak Wolvesin 15 milyon euroluk bir bütçe ayırdığı da belirtilen haberde şu yorum yapıldı:\r\n\r\nHırvatistanın Dünya Kupası finaline ulaşmasında büyük payı bulunan Domagoj Vida, Beşiktaşta gösterdiği performansla istikrarını ortaya koydu. Neredeyse 12 aydır aynı çizgisini ve performansını korudu.', 'Spor', '2019-04-14', 14, 12, 60, 1, 1),
(6, 'http://i2.haber7.net//haber/haber7/photos/2019/17/altinordudan_altaya_derbi_jesti_1556286498_5759.jpg', 'Altınordudan derbi jesti', 'Yapılacak planlama ile Passolig teknik ekipleri, statta ilk olarak Altınordu Çocuk Tribünü olarak kullanılan maraton tribündeki tüm futbol okulu öğrencileri ve Altınordu taraftarını kapalı tribüne alacak.\r\n\r\nİkinci adımda kale arkası tribününden bilet alan Altay taraftarı maraton tribününe aktarılacak. Bu işlemler nedeniyle bilet satışı yarın saat 13.00e kadar durdurulacak. Böylelikle maçı izleyecek Altay taraftarı sayısı, 500den stat kapasitesinin yüzde 10u olan 1000e yükselecek. Altınordu yönetimi, tüm maratonun tribünün Altaya açıldığını ancak yürürlükteki yasa gereği stat kapasitesinin yüzde 10undan fazla misafir takım seyircisine izin verilmediğini açıkladı.', 'Spor', '2019-04-03', 7, 7, 39, 1, 1),
(7, 'http://i2.haber7.net//haber/haber7/photos/2019/17/borsa_haftayi_yukselisle_tamamladi_1556291534_6877.jpg', 'Borsa haftayı yükselişle tamamladı', 'Borsa İstanbul 100 (BIST) endeksi günü yüzde 0,30’luk yükselişle tamamladı. Endeks, 284 puanlık artışla 94 bin 783 puandan kapanırken, toplam işlem hacmi 4,8 milyar lira oldu. Gün sonunda bankacılık endeksi yüzde 0,35 değer kazandı. Holding endeksi ise yüzde 0,04 azaldı.', 'Ekonomi', '2019-04-24', 8, 10, 63, 1, 1),
(8, 'http://i2.haber7.net//haber/haber7/photos/2019/17/korfezde_sessiz_kriz_acilim_beklenmiyor_1556269410_9778.jpg', 'Körfezde sessiz kriz! Açılım beklenmiyor', 'Fas Dışişleri Bakanı Nasır Buritanın bu ay gerçekleştirdiği Körfez turu kapsamında BAEyi ziyaret etmemesi iki ülke arasındaki gerginliği bir kez daha gözler önüne serdi. İki ülke arasındaki kriz, son olarak BAEnin Rabat Büyükelçisi Ali Salim el-Kabinin, Abu Dabiden gelen acil talep doğrultusunda Fastan ayrıldığı iddiasıyla yeniden gündeme geldi. \r\n\r\nFastaki bazı basın kuruluşlarının haberlerinde yer verilen iddiada, Büyükelçi Kabinin geçen hafta sürpriz bir şekilde Fastan ayrılarak ülkesine döndüğü öne sürülürken, Fas hükümetinden konuyla ilgili açıklama yapılmadı.\r\n\r\nFas Hükümet Sözcüsü Mustafa el-Halfi, başkent Rabatta dün düzenlediği haftalık basın toplantısında BAE Büyükelçisiyle ilgili soru üzerine, Bu konuda yorumum yok. ifadelerini kullandı.\r\n\r\nRabat-Abu Dabi ilişkilerini AA muhabirine değerlendiren Faslı uzmanlar, BAE Büyükelçisiyle ilgili iddialar görmezden gelinse dahi iki ülke arasında aylardır sessiz bir kriz olduğunu belirtti.\r\n\r\nKAYNAK: AA', 'Gundem', '2019-04-05', 5, 4, 22, 0, 1),
(9, 'http://i2.haber7.net//haber/haber7/photos/2019/17/arda_turanin_akli_galatasarayda_kalmis_1555932178_1131.jpg', 'Spor Ana Haberleri', 'Spor çok önemlidir...', 'Spor', '2019-04-04', 7, 12, 40, 1, 1),
(31, 'http://i2.haber7.net//haber/haber7/photos/2019/17/super_ligde_istifa_yollar_ayrildi_1556290088_7633.jpg', 'Spor Haberi', 'Sporlar...', 'Spor', '2019-04-09', 31, 1, 39, 0, 1),
(32, 'http://i2.haber7.net//haber/haber7/photos/2019/15/putinden_abdnin_petrol_uretim_yontemine_elestiri_1554819995_1083.jpg', 'Tüm dünya bu sözlere kilitlendi! Putin resmen ilan etti\r\n', 'İkinci Kuşak ve Yol Forumuna katılmak için Çinde bulunan Rusya Devlet Başkanı Vladimir Putin açıklamalarda bulundu.\r\n\r\nİşte gazetecilerin sorularını yanıtlayan Putinin açıklamalarından satır başları\r\n\r\nİDLİB MESELESİ\r\n\r\n- İdlibde askeri operasyonu ben göz ardı etmiyorum. Fakat Suriyeli dostlarımızla birlikte, insani durumu göz önüne alarak bunun bugün uygun olmadığını düşünüyoruz.\r\n\r\nSuriyede Anayasa Komitesinin kurulmasını muhalif gruplarının yavaşlattığını öne süren Putin, Tüm muhalif gruplarla çalışacağız. Sabırla, ısrarla, bu komitenin oluşturulması için çaba edeceğiz. Çünkü bu, siyasi sürecin başlangıcı için temel olarak düşünülebilir diye konuştu.\r\n\r\nABDNİN TÜRKİYE DAHİL 8 ÜLKENİN MUAFİYETİNİ KALDIRMASI\r\n\r\n- ABDnin İran yaptırımları muafiyetinin sona ermesinin ardından Rusya petrol üretimini hemen artırmayacak. Belli bir seviyede üretimi sürdürmek için OPECle anlaşmamız var ve bu anlaşma temmuz ayına kadar geçerli.\r\n\r\nABDDE TUTUKLANAN RUS AJANI\r\n\r\n- ABD topraklarında Rusya adına ajanlık yaptığı iddiasıyla 9 aydır gözaltında olan Rus vatandaşı Maria Butinaya 18 ay hapis cezası verildi. Putin, ABDnin Butina konusunda ABDnin gözaltı kararıyla başını dik tutmaya çalıştığını belirtti.', 'Gundem', '2019-04-19', 1, 0, 7, 1, 1),
(33, 'http://i2.haber7.net//haber/haber7/photos/2018/52/2019_hizmetli_memur_maaslari_ne_kadar_1545893298_8191.png', 'KOBİlere 3 milyar liralık yeni destek', 'KGFden yapılan yazılı açıklamaya göre, Avrupa Birliği tarafından KOBİlerin finansmana erişimini kolaylaştırmak ve büyümelerini desteklemek amacıyla yürütülen COSME projesi, Türkiye’de KGF iş birliği ile hayata geçecek.\r\n\r\nBu kapsamda Avrupa Yatırım Fonu tarafından KGF’ye kontrgaranti anlaşması ile hibe fon sağlanacak olup kefalet işlemleri Kredi Garanti Fonu’nun öz kaynaklarından yapılacak. KGF de bu kredilerin yüzde 80’ine kefalet verecek.\r\n\r\nSağlanacak kefalet desteği ile her bir KOBİ, 12 ayı ödemesiz dönem olmak üzere toplam 60 ay vade ile 1 milyon liraya kadar kredi kullanabilecek.\r\n\r\nKOBİ’ler COSME projesi için Akbank, Alternatif Bank, DenizBank, Garanti Bankası, Halkbank, İNG Bank, Türkiye İş Bankası, QNB Finansbank, Şekerbank, Türkiye Ekonomi Bankası, Türkiye Finans Katılım Bankası, VakıfBank, Vakıf Katılım Bankası, Yapı Kredi Bankası, Ziraat Bankası ve Ziraat Katılım Bankası olmak üzere projeye dahil olan toplam 16 bankaya başvurabilecek.\r\n\r\nBu proje kapsamında KOBİlere yaklaşık 3 milyar lira tutarında kredi kullandırılması bekleniyor.\r\n\r\nKAYNAK: AA\r\n', 'Ekonomi', '2019-04-28', 0, 0, 3, 0, 1),
(34, 'http://i2.haber7.net//haber/haber7/photos/2019/17/dunyada_esi_benzeri_yok_paha_bicilemiyor_1556443839_7494.jpg', 'Dünyada eşi benzeri yok! Paha biçilemiyor', 'Erbaa ilçesinde avukatlık yapan 2 çocuk babası 57 yaşındaki Necdet Dilek’in Taşınır Kültür ve Tabiat Varlığı Koleksiyonu Eser Envanter Defteri’ne kayıtlı eserlerinin arasında dünyanın bilinen en eski kılıçlarından birisi ile Büyük İskender motifli yüzüğü dikkat çekiyor. \r\n\r\nErbaa’nın Demirtaş köyünde bulunan yüzüğü tecil ettirerek envantere girdiren Dilek, özel kutularında bankada kasada muhafaza ettiği koleksiyonun nadide eserlerine gözü gibi bakıyor. Altın yüzüğün taşının ördekbaşı tonunda zümrüt olması ve içinde Büyük İskender’in portresinin yer alması dikkat çekiyor. Gün ışığında yüzükteki Büyük İskender portesi ortaya çıkarken, Helenestik döneme ait olduğu tahmin edilen yüzüğe motifin nasıl işlenmiş olabileceği sorusunun cevabı henüz bulunabilmiş değil. \r\n\r\nEŞİ BENZERİ YOK!\r\n\r\nTokat müzesine bağlı koleksiyoner olan Necdet Dilek, 302 adet kayıtlı tescilli eseri olduğunu söyledi. Koleksiyonu içerisinde iki parçanın öne çıktığını ifade eden Dilek, “Bunlardan bir tanesi Büyük İskender’in portresinin negatif olarak zümrüt taşa işlendiği Helenistik dönem altın yüzük ile dünyanın en eski kılıcı olarak kabul gören bilimsel dergide yayınlanmış olan ilk tunç çağı arsenli bakır kılıç. Yüzüğü satın alma yoluyla elime geçti. Erbaa’da çıkmış bir eser. İstanbul Kuyumcular Odasının ekspertiz raporu ile metalinin 21.5 ayar altın ve taşının doğal zümrüt olduğu ve yine işlenmiş taş olarak eserin negatif işlendiği sabit. Bugünkü teknoloji ile bile bu güzellikle bir eser yapılamıyorken iki bin yıldan daha önceki bir dönemde böyle bir eserin yapılmış olması açıklamaya muhtaç, uzman bir akademisyen bekliyoruz” dedi. ', 'Ekonomi', '2019-04-19', 0, 0, 1, 0, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `haber`
--
ALTER TABLE `haber`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `haber`
--
ALTER TABLE `haber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
