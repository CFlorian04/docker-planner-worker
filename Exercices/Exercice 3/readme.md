_CODEBECQ Florian_
# Exercice 3: Spécialisation des workers

_Pour créer des workers spécialiser dans certains calculs, on modifie les variables d'environnement 'ADD' et 'MULTI'. Si la valeur de la variable est 'true' alors le worker est capable de réaliser le calcul, sinon si la valeur est 'false' alors il n'est pas capable de faire le calcul._

## À faire :
- Lancer le script docker-compose_run.bat
- Dans un powershell, executer la commande suivantes :
```bat 
docker exec -it exercice3-planner-1 sh 
```
- Puis lancer ces commandes dans le terminal du container :
```bash
curl -X POST http://exercice3-planner-1:3000/register  -H "Content-Type: application/json"  -d '{"url": "http://exercice3-worker1-1:8080"}' 
curl -X POST http://exercice3-planner-1:3000/register  -H "Content-Type: application/json"  -d '{"url": "http://exercice3-worker2-1:8070"}'
``` 
### Ressources
##### docker-compose.yml
- Modification des variables d'environnement 'ADD' et 'MULT'. 
Worker1 (8080) → Multiplication seulement
Worker2 (8070) → Addition seulement