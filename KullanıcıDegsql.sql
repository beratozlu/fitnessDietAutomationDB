ALTER TABLE Kullanicilar ADD
    Cinsiyet NVARCHAR(10),
    BoyCm INT,
    KiloKg DECIMAL(5,2);

	INSERT INTO Kullanicilar (AdSoyad, DogumTarihi, Cinsiyet, Boy, Kilo)
VALUES
('Berat �zl�', '2001-10-31', 'Erkek', 175, 76.5),
('Ahmey Utku �olak', '2004-08-05', 'Erkek', 190, 105),
('Steven Tyler', '1948-03-26', 'Erkek', 177, 80);