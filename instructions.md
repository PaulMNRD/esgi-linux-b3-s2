# Projet ESGI3

## Sujet de projet

**Mise en place d’un système Linux client-serveur synchronisé, sécurisé et fonctionnel**

### Objectif

- Maîtriser la configuration de services réseau sous Linux (NTP, Postfix)
- Comprendre l'importance de la synchronisation horaire en environnement réseau
- Appliquer des politiques de sécurité via PAM
- Mettre en œuvre une configuration client-serveur entre deux machines Debian

### Livrable

À la fin de ce projet, chaque groupe doit livrer :

- Un dossier de projet clair, structuré, avec captures, configuration et explications
- Des scripts automatisés pour :
  1. Configurer Chrony
  2. Configurer Postfix
  3. Vérifier les logs PAM
- Un fichier `README.md` avec les consignes de test pour le correcteur
- Une démonstration sous forme d’enregistrement de 5 minutes à présenter lors de la présentation afin d’éviter les accidents de non-fonctionnement de dernière minute

### Contexte

Une petite entreprise veut mettre en place un serveur Debian assurant les rôles suivants :

- Serveur NTP pour la synchronisation horaire du réseau
- Serveur de messagerie (Postfix)
- Sécurité renforcée par PAM
- Configuration correcte du serveur X et du système de fuseaux horaires

Deux étudiants travaillent en binôme sur deux machines virtuelles Debian :

1. Une machine joue le rôle de serveur
2. Une autre joue le rôle de client

---

## Tâches à répartir

### I. Machine 1 : Serveur Debian

#### 1. NTP avec Chrony

- Installer et configurer Chrony pour servir de serveur NTP
- Autoriser les connexions du réseau local

#### 2. Postfix comme MTA

- Installer Postfix et le configurer pour envoyer des mails vers Internet via Gmail (ou autre)
- Créer un script d’envoi de mail en cas d’événement système :
  - Redémarrage
  - Tentative de connexion échouée (via PAM)
  - Un utilisateur qui change son mot de passe

#### 3. Fuseau horaire et locale

- Configurer le système pour utiliser un fuseau horaire différent de celui du client (ex : UTC vs Asia/Tokyo)
- Installer le support de plusieurs locales (`de_DE.UTF-8`, `es_ES.UTF-8`, `it_IT.UTF-8`)

#### 4. Sécurité avec PAM

Configurer PAM pour :

- Limiter les connexions (tentatives, horaires)
- Expiration et complexité des mots de passe

#### 5. Serveur X11

##### A. Affichage avancé des informations système

Ajouter un tableau de bord graphique affichant en temps réel :

- L’horloge système avec le fuseau horaire actif
- La charge du système (CPU, RAM, réseau)
- Les logs système (ex : tentatives de connexion échouées via PAM)
- Les événements liés à Postfix (ex : envoi/réception de mails)

**Outil suggéré :** Tkinter (Python)

##### B. Visualisation interactive des logs PAM et Postfix

Développer une interface graphique permettant :

- De lire et afficher les logs PAM et Postfix en temps réel
- De filtrer les logs par type d’événement (ex : échecs d’authentification, envois de mails)
- D’exporter les logs sous forme de fichier CSV ou JSON

##### C. Accès distant sécurisé au serveur X11

- Configurer X11 forwarding via SSH pour permettre aux étudiants d’accéder à l’interface graphique du serveur depuis la machine client
- Tester l’affichage des courbes interactives à distance

**Fonctionnement de X11 forwarding :**

- Le serveur X tourne sur la machine locale (client SSH)
- Une application graphique est lancée sur un serveur distant via SSH
- L'affichage est redirigé vers la machine locale grâce à SSH

---

### II. Machine 2 : Client Debian

#### 1. NTP Client (Chrony ou ntpd)

- Configurer la machine pour synchroniser son horloge avec le serveur
- Comparer l’heure avant/après synchronisation

#### 2. Postfix client

- Configurer Postfix pour relayer ses mails via le serveur ou tester directement via Gmail

#### 3. Vérification fuseau horaire

- Configurer un fuseau horaire différent du serveur
- Utiliser des commandes pour afficher et comparer l’heure du système et l’heure réseau

#### 4. Tests PAM et mail

- Tenter des connexions hors horaires autorisés (PAM)
- Changer le mot de passe pour déclencher des alertes par mail
