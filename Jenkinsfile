pipeline
{
  agent
  {
    label 'tci-jnlp-node'
  }
  tools {
    python 'Python-2.7'
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
            sh 'python --version'
            sh 'pip install -U pytest'
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
