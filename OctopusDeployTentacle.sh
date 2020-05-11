#Octopus Deploy Tentacle Installation Script
#!/bin/bash

serverUrl="https://xyz.octopus.app/"   # The url of your Octous server
thumbprint="xyz"       # The thumbprint of                                                                                         your Octopus Server
apiKey="API-xxxxxx"           # An Octopus Server api key w                                                                                        ith permission to add machines
name="machine name"      # The name o                                                                                        f the Tentacle at is will appear in the Octopus portal
workerPool="Linux Worker Pool"    # The worker pool to register the Tentacle in
configFilePath="/etc/octopus/default/tentacle-default.config"
applicationPath="/home/Octopus/Applications/"
environment="Dev"
role="Web-Server"
space="Teki"

/opt/octopus/tentacle/Tentacle create-instance --config "$configFilePath"
/opt/octopus/tentacle/Tentacle new-certificate --if-blank
/opt/octopus/tentacle/Tentacle configure --port 10933 --noListen False --reset-t                                                                                        rust --app "$applicationPath"
/opt/octopus/tentacle/Tentacle configure --trust $thumbprint
echo "Registering the Tentacle $name with server $serverUrl in worker pool $work                                                                                        erPool"
#/opt/octopus/tentacle/Tentacle register-worker --server "$serverUrl" --apiKey "                                                                                        $apiKey" --name "$name" --workerPool "$workerPool" --publicHostName "$name"  --s                                                                                        pace "$space"
/opt/octopus/tentacle/Tentacle register-with --server "$serverUrl" --apiKey "$ap                                                                                        iKey" --instance "Tentacle" --publicHostName "$name" --environment "$environment                                                                                        " --role "$role"
/opt/octopus/tentacle/Tentacle service --install --start
