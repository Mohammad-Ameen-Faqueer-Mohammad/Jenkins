pipeline {
    agent { label 'dev-server' }

    stages {
        stage('code') {
            steps {
                git url: 'https://github.com/Mohammad-Ameen-Faqueer-Mohammad/node-todo-cicd.git', branch: 'master'
            }
        }

        stage('test & build') {
            steps {
                sh 'docker build -t node-to-do-app .'
            }
        }

        stage('docker push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerHubCred',
                    usernameVariable: 'USERNAME',
                    passwordVariable: 'PASSWORD'
                )]) {
                    sh 'docker login -u $USERNAME -p $PASSWORD'
                    sh 'docker image tag node-to-do-app:latest $USERNAME/node-to-do-app:latest'
                    sh 'docker push $USERNAME/node-to-do-app:latest'
                }
            }
        }

        stage('deploy') {
            steps {
                echo 'Deploying the container...'
                sh 'docker compose down'
                sh 'docker compose up -d --build'
            }
        }
    }
}
