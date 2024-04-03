/*
1. Combien y a-t ’il de Chevaux Noir ?
2. Combien y a-t ’il de chevaux de la race AngloArabe?
3. Donner le numéro et le nom du cheval dont le Numéro de tatouage est : T0415
4. Combien y a-t-il d’éditions du concours : « Concours Dubai »?
5. Quel est le nombre total de participants dans toutes les éditions du Concours Dubai?
6. Dans quels concours /année les chevaux de l’écurie ont eu la première place?
7. Quels chevaux ont participé à l’édition 2018 du concours de Londres ?
8. Comment s’appelle le directeur de l’établissement ?
9. Combien y a-t ’il de propriétaires ?
10. Combien de chevaux le propriétaire N6 a acheté en 2020 ?
11. Combien il a payé pour acheter ses chevaux ?
*/



SELECT COUNT(*) AS nombre_chevaux_noir
FROM Cheval
WHERE Couleur = 'Noir';

SELECT COUNT(*) AS nombre_chevaux_angloarabe
FROM Cheval
WHERE Race = 'AngloArabe';

SELECT ID_cheval, Nom
FROM Cheval
WHERE ID_cheval IN (SELECT ID_cheval FROM Tatouage WHERE Numero_tatouage = 'T0415');

SELECT COUNT(*) AS nombre_editions_concours_dubai
FROM Competition
WHERE Nom = 'Concours Dubai';

SELECT SUM(Place_obtenue) AS nombre_total_participants_concours_dubai
FROM Participation
WHERE ID_competition = (SELECT ID_competition FROM Competition WHERE Nom = 'Concours Dubai');

SELECT Nom, Annee
FROM Competition
WHERE ID_competition IN (SELECT ID_competition FROM Participation WHERE Place_obtenue = 1);

SELECT DISTINCT ID_cheval
FROM Participation
WHERE ID_competition = (SELECT ID_competition FROM Competition WHERE Nom = 'Concours de Londres' AND Annee = 2018);

SELECT COUNT(DISTINCT ID_proprietaire) AS nombre_proprietaires
FROM Proprietaire;

SELECT COUNT(*) AS nombre_chevaux_achetes_2020
FROM Transaction
WHERE ID_proprietaire = 6 AND YEAR(Date_transaction) = 2020;

SELECT SUM(Prix) AS total_prix_achats_proprietaire_6
FROM Transaction
WHERE ID_proprietaire = 6;
