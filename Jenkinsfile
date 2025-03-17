pipeline {
    agent {
        docker {
            image 'cirrusci/flutter:stable'
        }
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dohadahrabou01/mini_app_products_sdk.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor -v'
            }
        }

        stage('Dépendances') {
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
                sh 'flutter build apk --release'
                archiveArtifacts artifacts: 'build/app/outputs/apk/release/*.apk', fingerprint: true
            }
        }
    }
}