-- a) Residenti che hanno almeno un’iscrizione, ordinati alfabeticamente
SELECT DISTINCT r.*
FROM RESIDENTE r
JOIN ISCRIZIONE i ON r.codice_fiscale = i.codice_fiscale_residente
ORDER BY r.cognome ASC, r.nome ASC;

--b) Iscrizioni in un certo periodo (con parametri @data_inizio, @data_fine)
SELECT *
FROM ISCRIZIONE
WHERE data_iscrizione BETWEEN @data_inizio AND @data_fine;

--c) Numero iscrizioni per ciascun residente
SELECT r.codice_fiscale, COUNT(i.id_iscrizione) AS numero_iscrizioni
FROM RESIDENTE r
LEFT JOIN ISCRIZIONE i ON r.codice_fiscale = i.codice_fiscale_residente
GROUP BY r.codice_fiscale;