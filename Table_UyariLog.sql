CREATE TABLE UyariLog (
    ID INT IDENTITY(1,1),
    KullaniciID INT,
    Tarih DATE,
    UyariMesaji NVARCHAR(255),
    LogZamani DATETIME DEFAULT GETDATE()
 );
