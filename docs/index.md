# The fnichol Helm Charts Library for Kubernetes

Applications and services, provided by [fnichol], ready to launch on
[Kubernetes] using the [Helm] package manager.

## TD;DR

```console
$ helm repo add fnichol https://fnichol.github.io/charts
$ helm search repo fnichol
$ helm install my-release fnichol/<chart>
```

## Before You Begin

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of
pre-configured Kubernetes resources.

To install Helm, refer to the
[Helm install guide](https://helm.sh/docs/intro/install/) and ensure that the
`helm` binary is in the `PATH` of your shell.

### Add Repo

The following command allows you to download and install all the charts from
this repository:

```console
$ helm repo add fnichol https://fnichol.github.io/charts
```

### Using Helm

Once you have installed the Helm client, you can deploy a Helm Chart into a
Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/)
if you wish to get running in just a few commands, otherwise the
[Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed
instructions on how to use the Helm client to manage packages on your Kubernetes
cluster.

Useful Helm Client Commands:

- View available charts: `helm search repo`
- Install a chart: `helm install my-release fnichol/<package-name>`
- Upgrade your application: `helm upgrade`

## Credits

Thank you to the amazingly thourough
[Bitnami Charts Library](https://github.com/bitnami/charts) project, which
formed the basis for the setup and structure of this project.

## Code of Conduct

This project adheres to the Contributor Covenant [code of
conduct][code-of-conduct]. By participating, you are expected to uphold this
code. Please report unacceptable behavior to fnichol@nichol.ca.

## Issues

If you have any problems with or questions about this project, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

Licensed under the Mozilla Public License Version 2.0 ([LICENSE.txt][license]).

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the MPL-2.0 license, shall be
licensed as above, without any additional terms or conditions.

[fnichol]: https://github.com/fnichol
[github]: https://github.com/fnichol/charts
[helm]: https://helm.sh/
[issues]: https://github.com/fnichol/charts/issues
[kubernetes]: http://kubernetes.io/
[license]: https://github.com/fnichol/charts/blob/master/LICENSE.txt
