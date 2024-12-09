# SAE5.02-BERGER
### Cahier des Charges : Automatisation et Gestion Intégrée de Mises à Jour, Surveillance Système et Gestion des Incidents

---

#### **Contexte du Projet :**

Les infrastructures informatiques modernes nécessitent une surveillance proactive et une gestion automatisée des mises à jour pour garantir leur sécurité, stabilité et performance. Ce projet a pour objectif de mettre en place une solution intégrée combinant **automatisation des mises à jour**, **surveillance système** et **gestion des incidents**. Les outils **Ansible** et **Docker** seront utilisés pour automatiser ces processus et garantir une administration simplifiée.

---

#### **Objectifs :**

1. **Automatiser les mises à jour systèmes et applicatives** :
   - Déployer un mécanisme centralisé pour appliquer les mises à jour de sécurité et correctifs.
   - Planifier les mises à jour critiques en minimisant les interruptions de service.

2. **Surveiller l’état des systèmes et des services** :
   - Implémenter un système de monitoring pour suivre les performances, l’utilisation des ressources et détecter les anomalies.
   - Visualiser les métriques via une interface utilisateur graphique.

3. **Gérer efficacement les incidents** :
   - Mettre en place un système d’alertes pour les défaillances critiques.
   - Automatiser la création et le suivi des tickets d’incidents en intégrant un outil ITSM (ex. GLPI, Jira).

4. **Garantir l’évolutivité et la sécurité** :
   - Permettre une extension facile du système pour de nouveaux services.
   - Renforcer la sécurité grâce à des mises à jour automatisées et à un suivi rigoureux.

---

#### **Détails des Services à Déployer :**

##### **2.1. Système de Mises à Jour Automatisées :**
- **Rôle :** Automatiser l’installation des correctifs et mises à jour sur l’ensemble des serveurs.
- **Outils :** Ansible pour la gestion des packages (APT, YUM, etc.).
- **Systèmes d’exploitation supportés :** Debian, Ubuntu, CentOS.
- **Fonctionnalités principales :**
  - Automatisation des mises à jour planifiées.
  - Création de rapports post-mise à jour.
- **Regroupement possible :** Avec le serveur de surveillance.

##### **2.2. Serveur de Surveillance (Monitoring) :**
- **Rôle :** Surveiller les performances des systèmes et des applications.
- **Outils :** Prometheus, Grafana.
- **Fonctionnalités principales :**
  - Collecte des métriques système (CPU, RAM, stockage, réseau).
  - Génération de tableaux de bord interactifs.
  - Détection et alerte en cas de seuils critiques dépassés.
- **Regroupement possible :** Avec la gestion des incidents.

##### **2.3. Gestion des Incidents :**
- **Rôle :** Centraliser la gestion des incidents et des alertes.
- **Outils :** GLPI (gestion des tickets) et Ansible pour automatiser les réponses.
- **Fonctionnalités principales :**
  - Génération automatique de tickets en cas d’incident.
  - Suivi des interventions et documentation des résolutions.
- **Regroupement possible :** Avec le serveur de surveillance.

##### **2.4. Conteneurisation avec Docker :**
- **Rôle :** Héberger les services de manière isolée et standardisée.
- **Outils :** Docker et Docker Compose.
- **Fonctionnalités principales :**
  - Déploiement rapide des applications de monitoring et de gestion des incidents.
  - Isolation des services pour une meilleure sécurité et maintenabilité.

---

#### **Prérequis Techniques :**

1. **Accès réseau** :
   - Connexion internet pour télécharger les mises à jour et les images Docker.
   - Configuration des pare-feux pour autoriser les ports nécessaires (HTTP, HTTPS, etc.).

2. **Environnement matériel** :
   - Serveur dédié ou machine virtuelle pour héberger les conteneurs.
   - Au moins 8 Go de RAM et 4 vCPU pour supporter les outils.

3. **Outils requis :**
   - Docker et Docker Compose installés sur le serveur.
   - Ansible configuré sur une machine d’administration.

---

#### **Déploiement des Services :**

- **3.1. Serveur de Mises à Jour :**
  - Nom de la machine : `update_manager`
  - Adresse IP : 192.168.1.10
  - Playbooks Ansible :
    - Installation et configuration des gestionnaires de paquets.
    - Automatisation des mises à jour planifiées.

- **3.2. Serveur de Surveillance :**
  - Nom de la machine : `monitoring_server`
  - Adresse IP : 192.168.1.11
  - Playbooks Ansible :
    - Installation de Prometheus et Grafana.
    - Configuration des règles d’alerte.

- **3.3. Serveur de Gestion des Incidents :**
  - Nom de la machine : `incident_manager`
  - Adresse IP : 192.168.1.12
  - Playbooks Ansible :
    - Déploiement de GLPI dans un conteneur Docker.
    - Automatisation de la liaison avec le système de monitoring.

---

#### **Sécurité et Maintenance :**

- **Mesures de sécurité :**
  - Politique stricte de gestion des mots de passe pour les accès administratifs.
  - Application immédiate des correctifs critiques via Ansible.
  - Mise en place de sauvegardes automatisées pour les données critiques.

- **Maintenance et documentation :**
  - Suivi des logs via le système de monitoring.
  - Documentation détaillée des configurations et des playbooks Ansible.
  - Formation des administrateurs au système.

---

#### **Évolutivité :**

- **Perspectives d’évolution :**
  - Intégration d’autres outils de gestion ITSM pour une meilleure orchestration.
  - Extension du système de surveillance pour inclure des applications spécifiques.
  - Ajout de workflows automatisés pour la résolution des incidents.

--- 

Ce projet fournira une solution robuste et automatisée pour gérer les mises à jour, surveiller les systèmes, et traiter les incidents, tout en garantissant une évolutivité pour répondre aux besoins futurs.
