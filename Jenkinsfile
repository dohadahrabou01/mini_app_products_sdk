pipeline {
    agent any
    environment {
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
                    sh 'which flutter || git clone https://github.com/flutter/flutter.git /usr/local/flutter'
                    sh 'export PATH=$PATH:/usr/local/flutter/bin'
                    sh 'flutter doctor -v'  // Vérifier l'installation de Flutter
                }
            }
        }
        stage('Dependencies') {
            steps {
                sh 'flutter pub get'
            }
        }
        stage('Tests') {
            steps {
                sh 'flutter test'
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk'
            }
        }
    }
}
