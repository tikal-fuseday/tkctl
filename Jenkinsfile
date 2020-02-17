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
            sh 'pip install --user --upgrade setuptools wheel'
            sh 'pip install --user tqdm'
            sh 'pip install --user --upgrade twine'
         }
      }
    }
    stage('Build') {
      steps {
        script {
            sh "python setup.py bdist_wheel"
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
            sh "python -u yorammi -m twine upload dist/*"
        }
      }
    }
  }
}
