pipeline {
    agent any
    environment {
        // Add Flutter to the PATH
        PATH = "/usr/local/flutter/bin:${env.PATH}"
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm  // Check out the source code from SCM
            }
        }
        stage('Setup Flutter') {
            steps {
                script {
                    // Check if Flutter is already installed
                    sh '''
                    if [ ! -d "/usr/local/flutter" ]; then
                        echo "Flutter not found. Installing Flutter..."

                      # Ensure Jenkins has write permissions to /usr/local
# Use sudo with a password (if configured) or avoid sudo entirely
  sudo mkdir -p /usr/local/flutter
                        sudo chown -R jenkins:jenkins /usr/local/flutter

                        # Clone Flutter from the official repository
                        git clone https://github.com/flutter/flutter.git /usr/local/flutter
                    else
                        echo "Flutter is already installed."
                    fi
                    '''
                    // Verify Flutter installation
                    sh 'flutter doctor -v'
                }
            }
        }
        stage('Dependencies') {
            steps {
                sh 'flutter pub get'  // Install Flutter dependencies
            }
        }
        stage('Tests') {
            steps {
                sh 'flutter test'  // Run tests
            }
        }
        stage('Build APK') {
            steps {
                sh 'flutter build apk'  // Build the APK
            }
        }
    }
}