Use fitnessDiyetDb;
GO
CREATE TRIGGER trg_AzSuUyarisi
ON GunlukTakip
AFTER INSERT
AS
BEGIN
    INSERT INTO UyariLog (KullaniciID, Tarih, UyariMesaji)
    SELECT KullaniciID, Tarih, 'Su tüketimi çok düþük!'
    FROM inserted
    WHERE SuTuketimiLt < 1.0;
END;
-- Su tüketimi 1 litreden az ise uyarý ver.