# provider-terrahelm

This is a proof of concept Crossplane 'meta-provider'. A provider that only
exists to install other providers. In this case we install provider-helm and
provider-terraform.

```console
$ up ctp provider install docker.io/negz/provider-terrahelm:v0.1.2
negz-provider-terrahelm installed

$ k get provider.pkg
NAME                               INSTALLED   HEALTHY   PACKAGE                                                    AGE
crossplane-contrib-provider-helm   True        True      xpkg.upbound.io/crossplane-contrib/provider-helm:v0.14.0   8s
negz-provider-terrahelm            True        True      index.docker.io/negz/provider-terrahelm:v0.1.2             11s
upbound-provider-terraform         True        True      xpkg.upbound.io/upbound/provider-terraform:v0.5.0          9s
```

This all mostly just works. The only oddity is that the package manager expects
all providers to have a controller to become healthy. We workaround this by
installing a 'controller' Deployment that does nothing.