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
            sh 'pip install --user --upgrade setuptools wheel'
            sh 'pip install --user tqdm'
            sh 'pip install --user --upgrade twine'
         }
      }
    }
    stage('Build') {
      steps {
        script {
            withPythonEnv('Python-2.7'){
                sh "python setup.py bdist_wheel"
            }
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
