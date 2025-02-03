pipeline{
    agent any
    stages{
        stage('pull code'){
            steps{
                git branch: 'dev', url: 'https://github.com/shyam-dev30/ang-spring-proj-infra.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('deploy'){
            steps{
                script{
                    docker build -t shyam30/com-backend:${BUILD_ID} .
                    docker push shyam30/com-backend:${BUILD_ID}
                    docker rmi shyam30/com-backend:${BUILD_ID}
                    kubectl apply -f ./yaml/Deployment.yaml
                }
            }
        }
    }
}