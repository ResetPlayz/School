# MiniProjet
## Partie 1
### Déploiement de WordPress et MySQL avec Volumes Persistants
#### Objectifs

    	Créer des PersistentVolumeClaims et PersistentVolumes
    	Créer un fichier kustomization.yaml
    	Appliquer le répertoire kustomization

#### Prérequis

	    Cluster Kubernetes
    	Outil kubectl

#### Création du kustomization.yaml
##### Ajout d'un générateur de Secret

```bash
cat <<EOF >./kustomization.yaml
secretGenerator:
- name: mysql-pass
  literals:
  - password=YOUR_PASSWORD
EOF
```

#### Configuration des ressources MySQL
#### Configuration des ressources WordPress
#### Ajout des configuration
```bash
cat <<EOF >>./kustomization.yaml
resources:
  - mysql-deployment.yaml
  - wordpress-deployment.yaml
EOF
```
kubectl apply -k ./
#### Vérification du Secret
#### Vérification des PersistentVolumes
#### Vérification des Pods
#### Vérification des Services
#### Accès à WordPress
#### Script copy test
#### Nettoyage

