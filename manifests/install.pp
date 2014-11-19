# == Class devpuppet::install
#
class devpuppet::install {
  $packages = ['wget', 'git', 'ruby-dev', 'g++', 'virtualbox']

  package { $packages: ensure => 'installed' } ->
  class { 'common::ubuntu::vagrant':
    user     => $devpuppet::user,
    userHome => $devpuppet::userHome,
  }

  bundler::install { '/vagrant':
    user       => $devpuppet::user,
    group      => $devpuppet::user,
    deployment => false,
  }

  contain common::ubuntu::vagrant
}
