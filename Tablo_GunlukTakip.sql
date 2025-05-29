USE FitnessDiyetDB; 
GO


CREATE TABLE gunlukTakip (
    TakipID INT PRIMARY KEY IDENTITY(1,1),
    KullaniciID INT FOREIGN KEY REFERENCES Kullanicilar(KullaniciID),
    Tarih DATE,
    AlinanKalori INT,
    YakilanKalori INT,
    SuTuketimiLt DECIMAL(4,2),
    Notlar NVARCHAR(255)
);