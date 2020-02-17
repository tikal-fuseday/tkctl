pipeline
{
  agent
  {
    label 'tci-jnlp-node'
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
            sh 'pip install --upgrade setuptools wheel'
            sh 'pip install tqdm'
            sh 'pip install --user --upgrade twine'
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
