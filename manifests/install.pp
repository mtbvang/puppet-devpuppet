# == Class devpuppet::install
#
class devpuppet::install {
  $packages = ['wget', 'git', 'ruby-dev', 'g++']

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

  class { 'common::ubuntu::virtualbox': }
  contain common::ubuntu::virtualbox
}
