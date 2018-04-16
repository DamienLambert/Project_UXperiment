#!/bin/bash

#capture des données de connexion et nom de la DB existante à sauvegarder
echo Nom de votre base de données à migrer:
read dbname

echo Utilisateur MySQL:
read username

echo Mot de Passe mysql:
read -s password

#création du dump de la DB existante à migrer
mysqldump --insert-ignore --no-create-db --no-create-info -u $username -p$password $dbname > testcballotdump.sql
echo 'testcballotdump.sql OK'

#créer la nouvelle DB cible cballotnew
mysql -u $username -p$password < cballot_SQL_latest.sql
echo 'cballot cible OK'

#import des données du dump dans la nouvelle DB cible
mysql -u $username -p$password cballotnew < testcballotdump.sql
echo 'import OK'
