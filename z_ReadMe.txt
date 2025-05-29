Halihazırda kullanıcısı mevcut ve yeni kullanıcı eklenebilen spor ve diyet takibi için yapılmış veritabanı otomasyonudur.
Derste öğrendiğimiz konulardan yola çıkarak hazırladığım bu otomasyonda procedure ve trigger konuları da mevcut.
Tablo olarak ;
- Kullanicilar, DiyetPlanlari, GunlukTakip, KiloDegisim ve UyariLog tablolarını yaratıp kullandım.
Trigger olarak;

- trg_YuksekKaloriUyari = hedeflenen kalori miktarından fazla alındığında uyarı verecek,
- trg_KiloDegisimTakibi = kullanıcı kilosu değiştiğinde arkaplanda değerleri kilo değişimi tablosuna aktaracak,
- trg_AzSuUyarisi = Su tüketimi istenilen seviyeden düşük ise uyarı verecek bir trigger ( Burada örnek olarak 1L verdim.).

Procedure olarak;
- GetGunlukKaloriRaporu = belirli bir kullanıcının belirli tarih aralığındaki günlük kalori takibini listeler,
- AddGunlukTakip = günlük takip edilecek sorgular için yarattığım procedure.

Aşağıda oluşturduğum veritabanını hızlıca test etmek için birkaç sorgu örneği yazdım.

-1-kullanıcı bilgilerini göster
SELECT KullaniciID, AdSoyad, Kilo
FROM Kullanicilar;

-2-kilosu değişen kullanıcının geçmişi
SELECT * 
FROM dbo.KiloDegisimLog
WHERE KullaniciID = 1
ORDER BY DegisimTarihi DESC;

-3- son 10 kilo değişimlerini göster
SELECT TOP 10 *
FROM KiloDegisimLog
ORDER BY DegisimTarihi DESC;

-4- Belirli bir kullanıcıya ait kalori takibi geçmişi
SELECT Tarih, AlinanKalori, YakilanKalori, SuTuketimiLt
FROM GunlukTakip
WHERE KullaniciID = 1
ORDER BY Tarih DESC;

-5-Su tüketimi 1 litrenin altında olan günler
SELECT KullaniciID, Tarih, SuTuketimiLt
FROM GunlukTakip
WHERE SuTuketimiLt < 2;


-6-Trigger test etmek için örnek veri girişi (4000 üzeri kalori)
INSERT INTO GunlukTakip (KullaniciID, Tarih, AlinanKalori, YakilanKalori, SuTuketimiLt)
VALUES (1, GETDATE(), 4200, 500, 2);

SELECT *
FROM dbo.UyariLog
ORDER BY LogZamani DESC;

-7- Kullanıcının kilosunu güncelle 
-- Önce mevcut kilosunu kontrol et
SELECT Kilo FROM Kullanicilar WHERE KullaniciID = 1;

-8- Yeni kilo gir
UPDATE Kullanicilar
SET Kilo = 82
WHERE KullaniciID = 1;


