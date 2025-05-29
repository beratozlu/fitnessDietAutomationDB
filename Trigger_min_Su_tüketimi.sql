Use fitnessDiyetDb;
GO
CREATE TRIGGER trg_AzSuUyarisi
ON GunlukTakip
AFTER INSERT
AS
BEGIN
    INSERT INTO UyariLog (KullaniciID, Tarih, UyariMesaji)
    SELECT KullaniciID, Tarih, 'Su t�ketimi �ok d���k!'
    FROM inserted
    WHERE SuTuketimiLt < 1.0;
END;
-- Su t�ketimi 1 litreden az ise uyar� ver.