This is a Dockerfile that will install the Teleport agent and help with setting up a simple client node.

To start, update teleport.yaml, replacing "example" in proxy_server to match your Teleport cluster domain name and port.

Ensure Docker is installed and running, then run "docker build ." in the directory with both the Dockerfile and teleport.yaml.

On your Teleport cluster, generate a join token with "tctl tokens add --type=node | grep -oP '(?<=token:\s).*'". Save this output.

Then, on your Docker host, start the container with:
"docker run -t -i --rm teleport-ubuntu teleport start --token=<join token> &"
