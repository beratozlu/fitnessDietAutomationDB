use fitnessDiyetDb;
Go

IF NOT EXISTS (
    SELECT * FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_NAME = 'KiloDegisimLog'
)
BEGIN
    CREATE TABLE dbo.KiloDegisimLog (
        LogID INT IDENTITY(1,1) PRIMARY KEY,
        KullaniciID INT,
        EskiKilo FLOAT,
        YeniKilo FLOAT,
        DegisimTarihi DATETIME DEFAULT GETDATE()
    );
END;
GO