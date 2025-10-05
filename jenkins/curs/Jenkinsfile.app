pipeline {
    agent any

    environment {
        DIR_LUCRU = "jenkins/curs"
        DOCKER_CREDENTIALS_ID = "dockerhub-credentials-id"
        DOCKERHUB_CREDENTIALS = credentials("${DOCKER_CREDENTIALS_ID}")
        IMAGE_NAME = "${DOCKERHUB_CREDENTIALS_USR}/curs-app"
        TAG = "$BUILD_NUMBER"
    }
    stages {
        stage('Lint - verific sintaxa'){
            steps {
                dir("${DIR_LUCRU}"){
                    sh 'pip install flake8 --break-system-packages'
                    sh 'python3 -m flake8 .'  
                }
            }
        }

        stage('Test') {
            steps {
               dir("${DIR_LUCRU}"){
                    sh 'pip install pytest --break-system-packages'
                    sh 'pip install -r requirements.txt'
                    sh 'python3 -m pytest .'  
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dir("${DIR_LUCRU}") {
                        dockerImage = docker.build("${IMAGE_NAME}:${TAG}")
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        dockerImage.push()   
                        dockerImage.push('latest')
                    }
                }
            }
        }
    }
}