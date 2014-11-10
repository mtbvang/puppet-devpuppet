# == Class devpuppet::params
#
# This class is meant to be called from devpuppet
# It sets variables according to platform
#
class devpuppet::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'devpuppet'
      $service_name = 'devpuppet'
    }
    'RedHat', 'Amazon': {
      $package_name = 'devpuppet'
      $service_name = 'devpuppet'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
