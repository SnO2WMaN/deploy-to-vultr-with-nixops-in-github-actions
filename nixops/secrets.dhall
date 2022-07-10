let webserver = { host = env:WEBSERVER_HOST as Text, port = env:WEBSERVER_PORT }

let hosts = { webserver }

in  { hosts }
