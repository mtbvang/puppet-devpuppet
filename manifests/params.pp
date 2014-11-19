# == Class devpuppet::params
#
# This class is meant to be called from devpuppet
# It sets variables according to platform
#
class devpuppet::params {
  $devUser = 'dev'

  case $::osfamily {
    'Debian'           : { $devUserHome = '/home/dev' }
    'RedHat', 'Amazon' : { fail("${::operatingsystem} not supported") }
    default            : { fail("${::operatingsystem} not supported") }
  }
}
