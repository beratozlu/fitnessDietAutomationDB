CREATE TABLE diyetPlanlari (
    DiyetID INT PRIMARY KEY IDENTITY(1,1),
    Adi NVARCHAR(100),
    HedefKalori INT,
    Aciklama NVARCHAR(255)
);