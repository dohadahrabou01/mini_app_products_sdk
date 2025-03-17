pipeline {
    agent any
    environment {
        // Ajouter le chemin Flutter à l'environnement
        PATH = "/usr/local/flutter/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Setup Flutter') {
            steps {
                script {
                    // Vérifier si Flutter est déjà installé, sinon l'installer
                    sh '''
                    if [ ! -d "/usr/local/flutter" ]; then
                        # Assurez-vous que Jenkins a les droits d'écriture dans /usr/local
                        sudo -S chown -R jenkins:jenkins /usr/local

                        # Cloner Flutter depuis le dépôt officiel
                        git clone https://github.com/flutter/flutter.git /usr/local/flutter
                    fi
                    '''
                    // Ajouter Flutter au PATH de l'environnement
                    sh 'export PATH=$PATH:/usr/local/flutter/bin'
                    // Vérifier l'installation de Flutter
                    sh 'flutter doctor -v'
                }
            }
        }
        stage('Dependencies') {
            steps {
                sh 'flutter pub get'  // Installer les dépendances Flutter
            }
        }
        stage('Tests') {
            steps {
                sh 'flutter test'  // Lancer les tests
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk'  // Construire l'APK
            }
        }
    }
}
