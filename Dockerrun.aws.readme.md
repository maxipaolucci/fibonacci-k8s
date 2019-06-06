# This file is just an explanation of the Dockerrun.aws.json
## https://docs.aws.amazon.com/AmazonECS/latest/userguide/task_definition_parameters.html

### NOTE: Fisrt thing is to say that Amazon EBS doesn't know how to work with container, internally uses ECS service (Elastic Container Service) when working with multiple containers and Dockerrun.aws.json, that's why we find the documentation there.

AWSEBDockerrunVersion: is the syntax version of the file

ContainerDefinitions:
  - name: just the name that is going to eventually shows up in a dashboard
  - image: is and image that is going to look in dockerhub
  - hostname: this is like the service name in docker-compose, ECS is going use this name as domains to reach   containers in its project network. Not required if you don't need to access it
  - essential: true | false . Makes the container essential, if value is true and the container crashes then    it is going to shutdown all the other containers defined in the group or containerDefinitions. If it        false nothing happens if it crash. AT LEAST ONE CONTAINER IN THE LIST MUST BE ESSENTIAL
  - links: links are unidirectional. Tells to which container a container must be linked. Use the name field    and not the hostname to specify the containers. In our example we link nginx to server and client because   nginx is explicitly routing traffic to these containers in the default.conf file doing "http://client" or   "http://api"
  - memory: amount off RAM to allocate to a container in MB. This is required by ECS to deploy the              containers. Hard to now the exact value we need for our projects, could need a bit of internet research.