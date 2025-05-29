

--Bu sorgudaki procedure belirli bir kullanýcýnýn belirli tarih aralýðýndaki günlük kalori takibini listeler

CREATE OR ALTER PROCEDURE GetGunlukKaloriRaporu
    @KullaniciID INT,
    @BaslangicTarihi DATE,
    @BitisTarihi DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        gt.Tarih,
        gt.AlinanKalori,
        gt.YakilanKalori,
        gt.NetKalori,
        gt.SuTuketimiLt,
        gt.Notlar
    FROM GunlukTakip gt
    WHERE gt.KullaniciID = @KullaniciID
      AND gt.Tarih BETWEEN @BaslangicTarihi AND @BitisTarihi
    ORDER BY gt.Tarih ASC;
END;

EXEC GetGunlukKaloriRaporu @KullaniciID = 1, @BaslangicTarihi = '2025-05-01', @BitisTarihi = '2025-05-27';
