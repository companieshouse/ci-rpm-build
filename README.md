# ci-rpm-build

A Docker configuration for building and cryptographically signing RPM packages.

## RPM build root

In addition to installing distribution-managed packages in the resulting container image, the `rpmdev-setuptree` command is used to create a standard RPM build tree under `/root`:

```
/
├── root
│   ├── rpmbuild
│   │   ├── BUILD    - Directory where software is unpacked and built
│   │   ├── RPMS     - Output directory for generated binary RPM packages
│   │   ├── SOURCES  - Directory containing original source tarballs and patches for package(s) being built
│   │   ├── SPECS    - Directory containing spec file(s) for each package(s) to build
│   │   └── SRPMS    - Output directory for generated source RPM packages
│   └── ...
└ ...
```

## Building RPM packages

Any RPM spec file(s) should be copied to `/root/rpmbuild/SPECS` by the relevant `Makefile` target for any project that uses this container. In addition, any source tarballs required to build the RPM (i.e. those files defined by `SourceN` fields in the RPM spec file, where `N` is a number) should be copied to `/root/rpmbuild/SOURCES`. Note that all source tarballs are expected to contain a parent directory whose name follows the pattern `<rpm-name>-<version>`.

The standard `rpm*` set of commands can be used to build packages. Generated binary and source RPMs will be output to `/root/rpmbuild/RPMS` and `/root/rpmbuild/SRPMS` respectively.
