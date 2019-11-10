provider "google" {
  version = "~> 2.0"
  credentials = "${file("account.json")}"
  project     = "{{project id}}"
  region      = "us-west1"
  zone        = "us-west1-b"
}

# Used to determine your public IP for forwarding rules
data "http" "whatismyip" {
  url = "http://whatismyip.akamai.com/"
}

module "dcos" {
  source  = "dcos-terraform/dcos/gcp"
  version = "~> 0.2.0"

  providers = {
    google = "google"
  }

  cluster_name        = "blin-gcp"
  ssh_public_key_file = "~/.ssh/id_rsa.pub"
  admin_ips           = ["${data.http.whatismyip.body}/32"]

  num_masters        = 1
  num_private_agents = 5
  num_public_agents  = 1

  dcos_version = "2.0.0"

  # Enterprise users uncomment this section and comment out below
  dcos_variant              = "ee"
  dcos_license_key_contents = "${file("./license.txt")}"
  # Make sure to set your credentials if you do not want the default EE
  # dcos_superuser_password_hash = "${file("./dcos_superuser_password_hash.sha512")}
  # dcos_superuser_username = "admin"

  #dcos_variant = "open"
  public_agents_additional_ports = ["8443", "9090", "10101", "10102", "10103", "10104", "10105", "10106", "10107"]

  dcos_cluster_docker_credentials_enabled =  "true"
  dcos_cluster_docker_credentials_write_to_etc = "true"
  dcos_cluster_docker_credentials_dcos_owned = "true"
  dcos_cluster_docker_registry_url = "{{docker_registry_url}}"
  dcos_use_proxy = "yes"
  dcos_http_proxy = "example.com"
  dcos_https_proxy = "example.com"
  dcos_no_proxy = <<EOF
  # YAML
   - "internal.net"
   - "169.254.169.254"
  EOF
  dcos_overlay_network = <<EOF
  # YAML
      vtep_subnet: 44.128.0.0/20
      vtep_mac_oui: 70:B3:D5:00:00:00
      overlays:
        - name: dcos
          subnet: 12.0.0.0/8
          prefix: 26
  EOF
  #dcos_rexray_config = <<EOF
  # YAML
  #  rexray:
  #    loglevel: warn
  #    modules:
  #      default-admin:
  #        host: tcp://127.0.0.1:61003
  #    storageDrivers:
  #    - ec2
  #    volume:
  #      unmount:
  #        ignoreusedcount: true
  #EOF
  dcos_cluster_docker_credentials = <<EOF
  # YAML
    auths:
      'https://index.docker.io/v1/':
        auth: Ze9ja2VyY3licmljSmVFOEJrcTY2eTV1WHhnSkVuVndjVEE=
  EOF
}

