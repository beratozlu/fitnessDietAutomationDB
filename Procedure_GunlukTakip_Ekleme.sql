-- Yeni günlük takip ekleyen procedure

CREATE OR ALTER PROCEDURE AddGunlukTakip
    @KullaniciID INT,
    @Tarih DATE,
    @AlinanKalori INT,
    @YakilanKalori INT,
    @SuTuketimiLt DECIMAL(4,2) = NULL,
    @Notlar NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO GunlukTakip (KullaniciID, Tarih, AlinanKalori, YakilanKalori, SuTuketimiLt, Notlar, NetKalori)
    VALUES (@KullaniciID, @Tarih, @AlinanKalori, @YakilanKalori, @SuTuketimiLt, @Notlar, @AlinanKalori - @YakilanKalori);
END;

EXEC AddGunlukTakip @KullaniciID=1, @Tarih='2025-05-27', @AlinanKalori=2200, @YakilanKalori=700, @SuTuketimiLt=2.3, @Notlar='Koþu ve yüzme yapýldý.';
