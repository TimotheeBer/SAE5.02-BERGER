# Étape 1 : Choisir une image de base avec Ubuntu
FROM ubuntu:20.04

# Étape 2 : Définir les variables d'environnement pour éviter les interactions
ENV DEBIAN_FRONTEND=noninteractive

# Étape 3 : Mettre à jour les paquets et installer les dépendances nécessaires
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    curl \
    nano \
    git \
    python3 \
    python3-pip \
    ssh \
    sudo \
    docker.io \
    docker-compose \
    ansible \
    locales \
    tzdata \
    && apt-get clean

# Étape 4 : Configuration du fuseau horaire (exemple : Europe/Paris)
RUN ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

# Étape 5 : Configuration de la locale (exemple : fr_FR.UTF-8)
RUN locale-gen fr_FR.UTF-8 \
    && update-locale LANG=fr_FR.UTF-8 \
    && update-locale LC_ALL=fr_FR.UTF-8

# Étape 6 : Installer Ansible et Docker
RUN pip3 install --upgrade pip && pip3 install ansible

# Étape 7 : Créer un utilisateur non-root pour exécuter des commandes
RUN useradd -m -s /bin/bash admin \
    && echo "admin:admin" | chpasswd \
    && adduser admin sudo

# Étape 8 : Autoriser Docker à être utilisé sans sudo
RUN usermod -aG docker admin

# Étape 9 : Générer une clé SSH pour l'utilisateur admin
# Étape 11 : Configurer l'inventaire Ansible
RUN echo "[update_manager]" > /home/admin/inventory.ini \
    && echo "192.168.1.10 ansible_ssh_user=admin" >> /home/admin/inventory.ini \
    && echo "[monitoring_server]" >> /home/admin/inventory.ini \
    && echo "192.168.1.11 ansible_ssh_user=admin" >> /home/admin/inventory.ini \
    && echo "[incident_manager]" >> /home/admin/inventory.ini \
    && echo "192.168.1.12 ansible_ssh_user=admin" >> /home/admin/inventory.ini \
    && chown admin:admin /home/admin/inventory.ini

# Étape 12 : Activer SSH et Docker
RUN systemctl enable ssh

# Étape 13 : Ouvrir les ports nécessaires
EXPOSE 22 80 443 9090 3000

# Étape 14 : Configurer l'entrée pour la commande
CMD ["/bin/bash"]
