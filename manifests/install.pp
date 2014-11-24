# == Class devpuppet::install
#
class devpuppet::install {
  $packages = ['wget', 'git', 'ruby-dev', 'g++']

  package { $packages: ensure => 'installed' } ->
  class { 'mtbvang::ubuntu::vagrant':
    user     => $devpuppet::user,
    userHome => $devpuppet::userHome,
  }

  bundler::install { '/vagrant':
    user       => $devpuppet::user,
    group      => $devpuppet::user,
    deployment => false,
  }

  contain mtbvang::ubuntu::vagrant

  class { 'mtbvang::ubuntu::virtualbox': }
  contain mtbvang::ubuntu::virtualbox
}
