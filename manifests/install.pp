# == Class devpuppet::install
#
class devpuppet::install {

  package { $::devpuppet::package_name:
    ensure => present,
  }
}
