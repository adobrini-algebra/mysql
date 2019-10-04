SELECT n.imeNastavnik, n.prezNastavnik, m.nazMjesto
    FROM nastavnik n
    JOIN mjesto m ON n.pbrStan = m.pbr;

SELECT s.imeStud, s.prezStud, i.ocjena, p.nazPred
    FROM stud s
    LEFT JOIN ispit i ON s.mbrStud=i.mbrStud
    LEFT JOIN pred p ON i.sifPred=p.sifPred;

SELECT p.*, d.*
    FROM pred p
    LEFT JOIN rezervacija r ON p.sifPred = r.sifPred
    LEFT JOIN dvorana d ON r.oznDvorana = d.oznDvorana;