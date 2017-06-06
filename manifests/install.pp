# Pulp Installation Packages
# Private class
class pulp::install {
  package { ['pulp-server', 'pulp-selinux', 'python-pulp-streamer']: ensure => $pulp::version, }

  ensure_packages(['python-gofer-amqp'], {
      ensure => $pulp::messaging_version,
    }
  )

  if $pulp::enable_parent_node {
    package { ['pulp-nodes-parent']: ensure => $pulp::version, }
  }

  if $pulp::enable_rpm {
    package { ['pulp-rpm-plugins']: ensure => $pulp::version, }
  }

  if $pulp::enable_docker {
    package { ['pulp-docker-plugins']: ensure => $pulp::version, }
  }

  if $pulp::enable_puppet {
    package { ['pulp-puppet-plugins']: ensure => $pulp::version, }
  }

  if $pulp::enable_python {
    package { ['pulp-python-plugins']: ensure => $pulp::version, }
  }

  if $pulp::enable_ostree {
    ensure_packages(['ostree'])
    package { ['pulp-ostree-plugins']: ensure => $pulp::version, }
  }
}
