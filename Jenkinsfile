node {
   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git credentialsId: '6e176ef1-5ba5-4d9d-9a6f-cf9ae261fa8e', url: 'https://github.com/charan1987/maven456.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'maven_3.6'
   }
   stage('Build') {
      // Run the maven build
      withEnv(["MVN_HOME=$mvnHome"]) {
        // if (isUnix()) {
         //   sh '"$MVN_HOME/bin/mvn"  pom: 'trucks/pom.xml' -Dmaven.test.failure.ignore clean package'
         //} else {
            bat(/"%MVN_HOME%\bin\mvn" pom: 'trucks/pom.xml' -Dmaven.test.failure.ignore clean package/)
       //  }
      }
   }
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archiveArtifacts 'target/*.jar'
   }
}
