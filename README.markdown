Seer-EC2 helps manage Seersystem on Amazon's Elastic Cloud Computing (EC2) environment.
----------------------------------------------------------------------------

TODO
- have simplecv and simpleseer as submodules
- install python requirement from the pip.requirements
- move start/stop stuff to supervizor
- add google chrome to deps
- add kiosk mode where chrome starts as window manager




[Setup Amazon Web Server Instance]

Before you can use these scripts, you should initialize an EC2 environment by
going to http://aws.amazon.com

1. Create an account (if you don't have one already)
2. Go to the [AWS Management Console](https://console.aws.amazon.com/s3/home)
3. Click the "EC2" tab
4. Click the "Launch Instance" button
5. In the launch instance dialog, select "Community AMIs"
6. Search for "ami-44f20f2d" (ubuntu testing daily maverick amd64)
7. Click the select button 
8. Change instance type to "Micro (T1.micro 613 MB)" and click Continue
9. Keep all defaults in the Advanced Instance Options and click Continue
10. Create a key pair if you haven't before -- or select an existing one
		a. If you haven't created an exist one then use these values
			* name the group "webssh" or something similar
			* add a new custom TCP rule for port 80 source 0.0.0.0/0, click add rule
			* add a new custom TCP rule for port 22 source 0.0.0.0/0, click add rule
		b. Click Continue
		

[Run AWS Instance]
11. In the "My Instances" screen, you should see your new instance spinning
12. Select your instance, and in the "Instance Actions" menu select "Connect" for instructions on how to log in

		If you can't connect and get the error:
		Please login as the ubuntu user rather than root user
	
		Make sure you are logging in with the user:
		ubuntu@YOUR-AWS-AMAZON-SERVER
						- not -
		root@YOUR-AWS-AMAZON-SERVER
	

[After AWS Instance is Running]
Once you have connected to your instance via SSH:

1. sudo su - (login as root)
2. apt-get install -y git
2. git clone git://github.com/ingenuitas/Seer-EC2.git 
3. ./Seer-EC2/bin/setup_cortex.sh
4. ./Seer-EC2/bin/start_services.sh
5. Your sources are in /root/src/cortex



[Testing]
You can run the 'screen' command to get multiple terminal instances.
Type 'man screen' for more help on using screen.
Once you start the server with the start_services.sh you should see:
	Starting subprocess with file monitor
	Starting server in PID 12654.
	serving on http://127.0.0.1:5000

Leave this server running, to test use just use this command:
	curl http://127.0.0.1:5000

should give some feedback if everything is working.



[Notes] 
If you are installing this on something other than the EC2 image suggested, you should use "build_cortex.sh" rather than setup_cortex.sh which only has EC2-specific binaries.




[TODO]

- add stop functions to rc.d directory
- package built dependencies
- create a custom AMI
