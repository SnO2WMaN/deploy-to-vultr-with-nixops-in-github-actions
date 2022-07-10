let ssh = { known_hosts = [ env:SSH_KNOWN_HOSTS as Text ] }

let webserver = { host = env:WEBSERVER_HOST as Text, port = env:WEBSERVER_PORT }

let hosts = { webserver }

in  { ssh, hosts }
