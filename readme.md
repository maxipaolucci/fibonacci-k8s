there are some thing in this course to do come extra configuration in Google cloud. Helm + Tiller, RBAC
Check lessons: 244, 245, 246, 247, 248

Lesson 247
Helm: is a CLI to run commands on Tiller
Tiller: does changes in the config of our cluster, create delete modify (our config files for k8s). But it needs permissions
RBAC (Role Based Access Control): Limit access inside our kubernetes cluster. Google cloud enables RBAC by default. In our local kubernetes is disabled by default so we could whatever we want, like change config, create remove secrets , deployments anything. In prod or in the cloud we need to deal with RBAC and create a set of permissions and roles to be able to deploy 
