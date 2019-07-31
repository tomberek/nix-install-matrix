{
  installScripts = let
    installUrls = {
      pre = "https://nixos.org/releases/nix/nix-2.1pre6385_d16ff76c/install";
      stable = "https://nixos.org/nix/install";
      "2.0.4" = "https://nixos.org/releases/nix/nix-2.0.4/install";
      "2.1.3" = "https://nixos.org/releases/nix/nix-2.1.3/install";
    };
    installUrl = installUrls."2.1.3";
  in [
    {
      name = "install-default";
      script = ''
        #!/bin/sh

        set -eux

        curl "${installUrl}" | sh
      '';
    }

    {
      name = "install-force-no-daemon";
      script = ''
        #!/bin/sh

        set -eux

        curl "${installUrl}" | sh -s -- --no-daemon
      '';
    }

    {
      name = "install-force-daemon";
      script = ''
        #!/bin/sh

        set -eux

        curl "${installUrl}" | sh -s -- --daemon
      '';
    }
  ];

  images = {
    "macos-sierra" = {
      # Sketchy :)
      image = "jhcook/macos-sierra";
      preInstall = "";
      system = "x86_64-darwin";
    };

    "macos-highsierra" = {
      # Sketchy :)
      image = "monsenso/macos-10.13";
      preInstall = "";
      system = "x86_64-darwin";
    };

    "arch" = {
      image = "generic/arch";
      preInstall = ''
        packman -S --no-confirm rsync
      '';
      system = "x86_64-linux";
    };

    "alpine-3-8" = {
      image = "generic/alpine38";
      preInstall = ''
        apk --no-cache add curl
      '';
      system = "x86_64-linux";
    };

    "alpine-3-7" = {
      image = "generic/alpine37";
      preInstall = ''
        apk --no-cache add curl
      '';
      system = "x86_64-linux";
    };

    "alpine-3-6" = {
      image = "generic/alpine36";
      preInstall = ''
        apk --no-cache add curl
      '';
      system = "x86_64-linux";
    };

    "alpine-3-5" = {
      image = "generic/alpine35";
      preInstall = ''
        apk --no-cache add curl
      '';
      system = "x86_64-linux";
    };

    "fedora-28" = {
      image = "generic/fedora28";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "fedora-27" = {
      image = "generic/fedora27";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "fedora-26" = {
      image = "generic/fedora26";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "fedora-25" = {
      image = "generic/fedora25";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "gentoo" = {
      image = "generic/gentoo";
      preInstall = ''
        emerge curl
      '';
      system = "x86_64-linux";
    };

    "centos-7" = {
      image = "centos/7";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "centos-6" = {
      image = "centos/6";
      preInstall = ''
        yum install curl
      '';
      system = "x86_64-linux";
    };

    "debian-9" = {
      image = "debian/stretch64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "debian-8" = {
      image = "debian/jessie64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "ubuntu-18-10" = {
      image = "ubuntu/cosmic64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "ubuntu-18-04" = {
      image = "ubuntu/bionic64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "ubuntu-16-04" = {
      image = "ubuntu/xenial64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "ubuntu-14-04" = {
      image = "ubuntu/trusty64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };

    "ubuntu-12-04" = {
      image = "ubuntu/precise64";
      preInstall = ''
        apt-get update
        apt-get install -y curl
      '';
      system = "x86_64-linux";
    };
  };
}
