pipeline
{
  agent
  {
    label 'tci-jnlp-node'
  }
  tools {
    python3 'python3'
  }
  options
  {
    ansiColor('xterm')
    timestamps()
    buildDiscarder(logRotator(numToKeepStr: '15'))
  }
  stages {
    stage('Setup') {
      steps {
        script {
            checkout scm
            sh 'python3 --version'
            sh 'pip3 install -U pytest'
         }
      }
    }
    stage('Build') {
      steps {
        script {
            echo "python setup.py bdist_wheel"
            sh "python setup.py bdist_wheel"
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
            echo "python -m twine upload dist/*"
        }
      }
    }
  }
}
