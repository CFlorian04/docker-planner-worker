_CODEBECQ Florian_
# Exercice 2: Plusieurs workers

_Ici, on remet le nombre de tâches comme par défaut (20). Ajout d'un 2e worker dans le docker-compose en créant un autre service avec un nom et des ports différents._

## À faire :
- Lancer le script docker-compose_run.bat
- Dans un powershell, executer la commande suivantes :
```bat 
docker exec -it exercice2-planner-1 sh 
```
- Puis lancer ces commandes dans le terminal du container :
```bash
curl -X POST http://exercice2-planner-1:3000/register  -H "Content-Type: application/json"  -d '{"url": "http://exercice2-worker1-1:8080"}' 
curl -X POST http://exercice2-planner-1:3000/register  -H "Content-Type: application/json"  -d '{"url": "http://exercice2-worker2-1:8070"}'
``` 
### Ressources
##### docker-compose.yml
- Réécriture de l'environnement TASKS pour le mettre à 20
- Ajout d'un container pour faire un deuxième worker (PORT: 8087)