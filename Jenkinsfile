pipeline
{
//   agent
//   {
//     label 'tci-jnlp-node'
//   }
  agent {
    // Equivalent to "docker build -f Dockerfile.build --build-arg version=1.0.2 ./build/
    dockerfile {
        filename 'Dockerfile'
        label 'python3'
    }
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
