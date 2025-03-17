pipeline {
    agent any // Utilise l'agent Jenkins par défaut (la machine où Jenkins est installé)

    environment {
        // Définissez le chemin de Flutter (si nécessaire)
        FLUTTER_HOME = '/usr/local/flutter'
        PATH = "${env.FLUTTER_HOME}/bin:${env.PATH}"
    }

    stages {
        // Étape 1 : Checkout du code source depuis GitHub
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dohadahrabou01/mini_app_products_sdk.git'
            }
        }

        // Étape 2 : Vérifier que Flutter est correctement configuré
        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor -v'
            }
        }

        // Étape 3 : Récupérer les dépendances du projet
        stage('Dépendances') {
            steps {
                sh 'flutter pub get'
            }
        }

        // Étape 4 : Exécuter les tests
        stage('Tests') {
            steps {
                sh 'flutter test'
            }
        }

        // Étape 5 : Builder l'APK
        stage('Build APK') {
            steps {
                sh 'flutter build apk --release'
                archiveArtifacts artifacts: 'build/app/outputs/apk/release/*.apk', fingerprint: true
            }
        }
    }
}