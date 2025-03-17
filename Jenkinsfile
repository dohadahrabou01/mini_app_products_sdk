pipeline {
    agent any

    environment {
        FLUTTER_HOME = '/usr/local/flutter' // Chemin vers Flutter SDK
        PATH = "${env.FLUTTER_HOME}/bin:${env.PATH}"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/dohadahrabou01/mini_app_products_sdk.git'
            }
        }

        stage('Setup Flutter') {
            steps {
                script {
                    // Installez Flutter si nécessaire (ex: sur un agent Docker)
                    sh 'flutter doctor -v'
                }
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

        // Optionnel : Build iOS (nécessite un agent macOS)
        // stage('Build iOS') {
        //     steps {
        //         sh 'flutter build ios --release'
        //     }
        // }
    }
}