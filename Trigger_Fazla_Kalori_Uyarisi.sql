-- �nce varsa sil
DROP TRIGGER IF EXISTS dbo.trg_YuksekKaloriUyari;
GO

CREATE TRIGGER dbo.trg_YuksekKaloriUyari
ON dbo.GunlukTakip
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.UyariLog (KullaniciID, Tarih, UyariMesaji)
    SELECT KullaniciID,
           Tarih,
           'G�nl�k kalori al�m� 4000''i ge�ti!'
    FROM inserted
    WHERE AlinanKalori > 4000;
END;
GO
