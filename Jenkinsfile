pipeline 
{
    agent any
    stages
    {
        stage('Building Dockerfile')
        {
           steps
           {              
                sh 'docker build -t apoorva .'
              
           }
        }
        stage('Run the container')
        {
            steps
            {
                sh ' docker run apoorva'
            }
        }
        stage('Giving the tag')
        {
            steps
            {
                sh 'docker tag apoorva apoorvasahu34/jenkins:apoo'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'apoorva_git_login', usernameVariable: 'apooUSR', passwordVariable: 'apooPSW')]) 
                {
                    sh 'echo ${apoorvaPSW} | docker login -u ${apooUSR} --password-stdin'

                }
            }   
        }
        stage('Pushing image to DockerHub')
        {
            steps
            {     
                sh 'docker push apoorvasahu34/jenkins:apoo'
            }          
        }
        stage('Pull image from DockerHub')
        {
            steps
            {     
                sh 'docker pull apoorvasahu34/jenkins:apoo'
            }
        }
    }
}
