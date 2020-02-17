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
            sh 'python3 --version'
            sh 'pip3 install --user --upgrade setuptools wheel'
            sh 'pip3 install --user tqdm'
            sh 'pip3 install --user --upgrade twine'
         }
      }
    }
    stage('Build') {
      steps {
        script {
            sh "python3 setup.py bdist_wheel"
        }
      }
    }
    stage('Deploy') {
      steps {
        script {
            sh "python3 -m twine upload --config-file .pypirc dist/*"
        }
      }
    }
  }
}
