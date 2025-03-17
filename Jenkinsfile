pipeline {
    agent any
    environment {
        PATH = "/opt/flutter/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Setup Flutter') {
            steps {
                sh 'flutter doctor -v'
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