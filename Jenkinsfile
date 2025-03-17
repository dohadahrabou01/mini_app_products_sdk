pipeline {
    agent any
    environment {
        FLUTTER_HOME = "${WORKSPACE}/flutter"
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
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
                    sh '''
                    if [ ! -d "$FLUTTER_HOME" ]; then
                        echo "Flutter not found. Installing Flutter..."
                        git clone https://github.com/flutter/flutter.git $FLUTTER_HOME
                    else
                        echo "Flutter is already installed."
                    fi
                    '''
                    sh 'flutter doctor -v'
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
