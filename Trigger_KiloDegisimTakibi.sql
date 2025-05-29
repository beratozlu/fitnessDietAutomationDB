
DROP TRIGGER IF EXISTS dbo.trg_KiloDegisimTakibi;
GO


CREATE TRIGGER dbo.trg_KiloDegisimTakibi
ON dbo.Kullanicilar
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT UPDATE(Kilo)
        RETURN;

    INSERT INTO dbo.KiloDegisimLog (KullaniciID, EskiKilo, YeniKilo)
    SELECT 
        i.KullaniciID,
        d.Kilo AS EskiKilo,
        i.Kilo AS YeniKilo
    FROM inserted i
    INNER JOIN deleted d 
        ON i.KullaniciID = d.KullaniciID
    WHERE i.Kilo <> d.Kilo;
END;
GO