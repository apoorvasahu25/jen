pipeline 
{
    agent any
    stages
    {
        stage('Building Dockerfile')
        {
           steps
           {              
                sh 'docker build -t apoo .'
              
           }
        }
        stage('Run the container')
        {
            steps
            {
                sh ' docker run apoo'
            }
        }
        stage('Giving the tag')
        {
            steps
            {
                sh 'docker tag apoo apoorvasahu34/jenkins:apoo'
            }
        }
        stage('Docker login')
        {
            steps
            {
                withCredentials([usernamePassword(credentialsId: 'apoorva_git_login', usernameVariable: 'apooUSR', passwordVariable: 'apooPSW')]) 
                {
                    sh 'echo ${apooPSW} | docker login -u ${apooUSR} --password-stdin'

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

