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
    buildDiscarder(logRotator(numToKeepStr: '4'))
  }
  stages {
    stage('Setup') {
      steps {
        script {
            checkout scm
            sh 'apt-get python36u python36u-devel python36u-pip python-pip'
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
            sh "python -m twine upload --config-file .pypirc dist/*"
        }
      }
    }
  }
}
