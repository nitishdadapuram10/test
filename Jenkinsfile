
pipeline{
    agent any
   environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages{
        stage('checkout from GIT'){
            steps{
               git branch: 'main', credentialsId: 'testpipeline', url: 'https://github.com/nitishdadapuram10/test.git'
            }
        }
   
        stage('Terraform Destroy'){
          steps{
             bat   'terraform destroy --auto-approve'
          }
       }
       
    }
}
