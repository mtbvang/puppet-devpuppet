# == Class devpuppet::params
#
# This class is meant to be called from devpuppet
# It sets variables according to platform
#
class devpuppet::params {
  case $::osfamily {
    'Debian': {

    }
    'RedHat', 'Amazon': {

    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
