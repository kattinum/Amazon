pipeline {
    agent any
    stages {
//		stage('Checkout Code') {
//            steps {
//                cleanWs()
//                git branch: "master", credentialsId:'d5509d5e-9c34-4bbe-9989-2538033c86fb', url:'https://github.com/kattinum/Amazon.git'
//            }
//        }
		stage('Functional regression tests') {
            steps {
				timeout(time: 30, unit: 'MINUTES'){
					retry(5){
					  bat label: '', script: 'docker run -v %WORKSPACE%:/opt/robotframework/tests:Z -v %WORKSPACE%:/opt/robotframework/reports:Z  -e ROBOT_TEST_RUN_ID="/Results" -e BROWSER=chrome -v /dev/shm:/dev/shm -e ROBOT_OPTIONS="--loglevel TRACE --name AmazonTesting -s *Amazon" kattinum/rfdocker:0.9'	
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
//					       def mailRecipients = "kattinum@yahoo.com"
					       def jobName = currentBuild.fullDisplayName
					       def jobStatus = currentBuild.currentResult
					       emailext body: '''${SCRIPT, template="robot-org.template"}''',
// 					       emailext body: '''''',
								   mimeType: 'text/html',
								   subject: "[Jenkins]Amazon:Build${jobName}-${jobStatus}", 
								   to: "${mailRecipients}",								   
								   attachmentsPattern: 'results.zip'
//					       archiveArtifacts artifacts: 'Results/*.html', onlyIfSuccessful: false
						  }
							
						} 		
					}
				}	
			}	
		
		}
	}

}	

//				}
//			}
//        }
//	}	
//}				
//	post {
//		always {
//			script {
//					   def mailRecipients = "kattinum@yahoo.com"
//					   def jobName = currentBuild.fullDisplayName
//					   def jobStatus = currentBuild.currentResult
//					   emailext body: '''${SCRIPT, template="robot-org.template"}''',
//								   mimeType: 'text/html',
//								   subject: "[Jenkins] Build${jobName}-${jobStatus}Amazon", 
//								   to: "${mailRecipients}",								   
//								   attachmentsPattern: 'results.zip'		   
				
//					}
//			   }
		   			
//		}
//}	