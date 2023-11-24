_CODEBECQ Florian_
# Exercice 4: Nombre de workers dynamique

_Pas trouver de façon d'utiliser le docker-compose pour créer de manière dynamique plusieurs instances de l'image worker avec des ports différents. Avec cette méthode, la création des workers peut-être interrompu sans raison. Si il y a le problème, alors il faut juste relancer le script._

## À faire :
- Lancer le script docker_run.bat

### Ressources
##### docker_run.bat
- Créer l'image et le container du planner
- Créer l'image du worker
- Fait une boucle pour créer plusieurs build de l'image du worker avec des noms/ports différents
- Ajoute le worker dans la liste des register du planner