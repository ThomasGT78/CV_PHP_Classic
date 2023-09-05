	/************************************
	*	Connecter le serveur local PHP	*
	************************************/

// Attention à ne pas être connecté en même temps sur Apache sinon il suffit de modifier le numero 8081
`
ouvrir le Terminal de VSC
php -S localhost:8081
`
		/** Ouvrir la page Wev **/
`
http://localhost:8081/home.php
http://localhost:8081/display_cv.php
http://localhost:8081/manage_cv.php
`

			/** ADD/COMMIT/PUSH **/

// Aller dans le dossier où le git init est créé
`cd C:\Users\thoma\Documents\Développeur`
ou
`dans le terminal de VSC ouvert dans le projet`

// Ajouter 1 ou plusieurs fichiers dans la zone de transit
`
git add .
`
// or
`
git add [file_or_folder_path]\.
git add wp-content\themes\Child-Theme-Divi\.
`
// Valider le dépôt dans le «local repository»
`
git commit -m "message"
`

// Envoyer sur github
`
git push origin [branch_name]
git push origin dev
`

			/** BRANCH **/

// commit dans la branch
`
git checkout branch
"Écrir  son code"
git add .
git commit -m "message"
git push origin branch
`
// merge dans master
`
git checkout master
git merge branch
git push origin master
`