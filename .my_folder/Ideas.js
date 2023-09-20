// Global
`-Utiliser le site de l'apec ou autre de recrutement comme idée de présentation 
- différents types de users (Admin, Test, Visiteur)
	=> Admin
		=> Home page + Dashboard + Display CV
	=> Visiteur
		=> Home page + Display CV
		=> Lien Projet pour les tester
	=> Test
		=> Home page + Dashboard + Display CV
		=> Acces à un CV test modifiable pour tester le CRUD, les fonctionnalité du Dashboard et le Display
		=> Lien Projet pour les tester + lien Github pour voir le Code

- Thème Modifiable pour toutes les pages (Créer Table « theme » dans dataBase?)
	=> Bouton de thème situé dans la bar de nav à droite (déroulant en version mobile)
	=> click => affiche la liste des thèmes existant avec des pastilles de couleurs à cliquer
- Option jour/nuit sur chaque Thème (situé dans la bar de nav à droite) icone petite lune ou soleil
- Bar de navigation dynamique, n'affiche pas le lien vers la page en cours.


`
// DISPLAY CV
`
- Display CV n'affiche pas le header et affiche seulement un retour vers home dans la barre de nav (ou aussi dashboard seulement si user connecté)
- Version Anglaise et Espagnol
- visibilité par dates ou catégories
- déroulement des détails (expériences, formations,)
- avec déroulement qui permet de voir toutes les expériences non principales
- galerie photo si clic sur la photo
- photo de cv avec option diaporama ou Non
- page dynamique avec des actions sur des clics ou autres
- compte le nombre de vues
- peut être liker
- autoriser commentaire de suggestion de fonctionnalité ou de report de bug (+ sur le dashboard de test ça)
- CV 2.0 (affichage graphique ou linéaire au choix)
- QR code affiché sur le CV pdf pour accès rapide au recruter en cas de version papier
- XXX QR code lien linkedIn, github, page facebook de voyage, etc...(?? Je sais pas si c'est utile)
- Boutton de partage du CV avec 2 options
	=> téléchargement direct du CV en PDF (CV en cours)
	=> envoi par email le lien du CV et/ou son format pdf (choix à cocher par le user)
- Bouton de copie de l'url du CV pour l'envoyer facilement sur whatsapp ou autre social média


`
// DASHBOARD UTILISATEUR
`
- Version Anglaise et Espagnol
- permet d'ajouter des nouvelles expériences, diplômes, COMPÉTENCES etc...
- gérer la galerie photo
- permet de modifier les données existantes
- Création de plusieurs CV (Dev, Coach, Tourisme, complet...) 
- Choisir l'ordre d'apparition des données:
	=> skills, exp, hobbies, languages, values, deggrees
	=> gestion du code coté clients dans array (new table « order » ou inclue dans « tags » ?)
- visualiser le nombre de vue totales et avec tableau de statistiques sur le temps (utile pour voir qui)
- demander Nom / Prénom / Entreprise et afficher un suivi par date et voir le nombre de fois qu'une même personne s'est connecté (pourquoi?)
- Lien de téléchargement du QR pour le télécharger en format .jpg ou pdf (pour y avoir accès offline et le montrer n'importe où)
- Peut décider ou non d'afficher ou d'imprimmer le QR code sur le CV ou de le cacher


- la description de l'Expérience se fait en plusieurs points (séraprer par des « ; » et des « / » les missions et sous-mission, ou créer une nouvelle table des missions)


`
// HOME
`
- Affiche un message de bienvenue différents pour les users (Admin, test, visiteur)
- Affiche un liens vers CV et d'autres projets
- Afficher le QR pour pouvoir le faire scanner rapidement depuis mon tel au recruteur


`
// FORMAT MOBILE
`
- afficher une nav bar hamburger en forme de petits carrés
	- click = déroulement sur une petite colonne à gauche


	
`
