# Koronavilkku OpenShift Configs

This directory contains configs to run Koronavilkku backend in OpenShift.
Configs are a wireframe model allowing developer to test application in
OpenShift. At current the config is very basic.

![openshift-app](https://pbs.twimg.com/media/Eg41byUXYAARgRx?format=png&name=small)

# Features

Configuration done to OpenShift:

* Builds containers from github repository code
* Stores containers to OpenShift internal registry
* Deploys containerized:
  * PostgreSQL database
  * exposure-notification backend
  * publish-token service
* Sets application health monitoring
* Includes webhook from github
* Sets environment variables for services

Database is in purpose emphemeral, so developer can easily wipe the database
just by killing the database pod.

# How to install

As a prerequisite, you need to

* Have access to OpenShift environment, either:
  * Your own openshift instance
  * [OpenShift Online](https://www.openshift.com/products/online/)
  * [CRC](https://github.com/code-ready/crc) for developer laptop, free
* install [oc tool](https://docs.openshift.com/container-platform/latest/cli_reference/openshift_cli/getting-started-cli.html).
* Modify secrets in these yamls to be unique to your environment

Once the above is done, run:

```console
git clone git@github.com:ikke-t/koronavilkku-backend.git
cd koronavilkku-backend/openshift
oc login
oc new-project koronavilkku
./install.sh
```

Log into your OpenShift to see Koronavilkku getting built, and add webhooks
to your github project for triggering builds on commit.

# ToDo

This is very quickly done scetch setup. Some recommendations to continue with:

* Create GitOps and dynamic install methods, e.g:
  * Ansible ([example here](https://redhatnordicssa.github.io/ansible-kubernetes-gitops))
  * [Flux](https://github.com/fluxcd/flux)
  * [ArgoCD](https://argoproj.github.io/argo-cd/)
  * Helm or Ansible Operator
  * OpenShift Template
* Add Jenkins or Tekton pipelines
  [example](https://gitlab.com/fevermap/fevermap/-/tree/master/ocp/staging/pipelines)
* Add Let's Encrypt cert creation for routes
* Add test tools
* Improve the build process to be two step build for smaller target images.


