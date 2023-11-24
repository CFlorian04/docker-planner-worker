# Exercice 1: Dockeriser les Serveurs

## À faire :
- Lancer le script docker-compose_run.bat
- Dans un powershell, executer la commande suivantes :
```powershell 
docker exec -it exercice1-planner-1 sh 
```
- Puis lancer cette commande dans le terminal du container :
```bash
curl -X POST http://exercice1-planner-1:3000/register  -H "Content-Type: application/json"  -d '{"url": "http://exercice1-worker-1:8080"}' 
``` 
### Ressources
##### docker-compose.yml
- Réécriture de l'environnement TASKS pour le mettre à 4

##### docker-compose_run.bat
- Fichier de script pour supprimer et recréer un container (avec rebuild) à partir de docker-compose.yml