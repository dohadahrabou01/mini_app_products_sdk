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
                        # Assurez-vous que Jenkins peut créer les fichiers dans /usr/local
                        sudo chown -R jenkins:jenkins /usr/local
                        # Installer Flutter
                        git clone https://github.com/flutter/flutter.git /usr/local/flutter
                    fi
                    '''
                    sh 'export PATH=$PATH:/usr/local/flutter/bin'  // Ajouter Flutter au PATH
                    sh 'flutter doctor -v'  // Vérifier l'installation de Flutter
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
