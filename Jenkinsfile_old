pipeline {
    agent none
    stages {
        stage('Functional regression tests') {
            agent { 
				docker {
                image 'kattinum/rfdocker:0.9'
                args '--shm-size=1g -u root -e ROBOT_TEST_RUN_ID="/Results" -e BROWSER=chrome -v /dev/shm:/dev/shm  -e ROBOT_OPTIONS="--loglevel TRACE --name AmazonTesting -s *Amazon"' }
            }
            environment {
                BROWSER = 'chrome'
                ROBOT_TESTS_DIR   = "$WORKSPACE"
                ROBOT_REPORTS_DIR = "$WORKSPACE"
            }
            steps {
				timeout(time: 30, unit: 'MINUTES'){
					retry(1){
                sh '''
				      /opt/robotframework/bin/run-tests-in-virtual-screen.sh
                '''
				script{
					  zip zipFile: 'results.zip', archive: false, dir: 'Results', glob: '*.*'
                      step(
						  [	
                            $class              : 'RobotPublisher',
                            outputPath          : 'Results',
                            outputFileName      : "output.xml",
                            reportFileName      : 'report.html',
                            logFileName         : 'log.html',
                            disableArchiveOutput:  false,
                            passThreshold       :  95.0,
                            unstableThreshold   :  90.0,
                            otherFiles          :  "*screenshot.png"				
						  ]
                        )	
				script{		
						   def mailRecipients = "kattinum@yahoo.com"			
					       def jobName = currentBuild.fullDisplayName
					       def jobStatus = currentBuild.currentResult
					       emailext body: '''${SCRIPT, template="robot-org.template"}''',
								   mimeType: 'text/html',
								   subject: "[Jenkins]Amazon:Build${jobName}-${jobStatus}", 
								   to: "${mailRecipients}",								   
								   attachmentsPattern: 'results.zip'
					       archiveArtifacts artifacts: 'Results/*.html', onlyIfSuccessful: false
						  }
							
						} 
				    }
			    }
            }						
		}
		
	}
	
}