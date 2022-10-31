pipeline 
{
    agent any
    stages
    {
        stage('Build Dockerfile')
        {
           steps
           {              
                sh 'docker build -t ubuntu .'
              
           }
        }
        stage('Run container')
        {
            steps
            {
                sh 'docker run ubuntu'
            }
        }
        stage('Giving tag')
        {
            steps
            {
                sh 'docker tag ubuntu apoorvasahu34/jenkins:ubuntu'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'docker-login', usernameVariable: 'ashUSR', passwordVariable: 'ashPSW')]) 
                {
                    sh 'echo ${ashPSW} | docker login -u ${ashUSR} --password-stdin'

                }
            }   
        }
        stage('Push image to DockerHub')
        {
            steps
            {     
                sh 'docker push apoorvasahu34/jenkins:ubuntu'
            }          
        }
        stage('Pull image from DockerHub')
        {
            steps
            {     
                sh 'docker pull apoorvasahu34/jenkins:ubuntu'
            }
        }
    }
}
