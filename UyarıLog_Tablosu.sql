SELECT gt.TakipID, gt.KullaniciID, k.AdSoyad, gt.Tarih, gt.AlinanKalori, gt.YakilanKalori, gt.SuTuketimiLt, gt.Notlar, gt.NetKalori
FROM GunlukTakip gt
INNER JOIN Kullanicilar k ON gt.KullaniciID = k.KullaniciID
WHERE gt.KullaniciID = 1 AND gt.Tarih = '2025-05-27';