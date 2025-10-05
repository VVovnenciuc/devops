pipeline {
    agent any

    environment {
        DIR_LUCRU = "jenkins/curs"
    }
    stages {
        stage('IAfiseaza director curent') {
            steps {
                script {
                    dir("${DIR_LUCRU}") {
                        sh 'pwd'
                        sh 'ls -al'
                    }
                }
            }
        }
    }
}