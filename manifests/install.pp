# == Class devpuppet::install
#
class devpuppet::install {
  $packages = ['wget', 'git', 'ruby-dev', 'libxml2-dev', 'libxslt1-dev', 'g++', 'build-essential']

  package { $packages: ensure => 'installed' } ->
  class { 'common::ubuntu::vagrant': }

  bundler::install { '/vagrant':
    user       => 'vagrant',
    group      => 'vagrant',
    deployment => false,
  }

  contain common::ubuntu::vagrant
}
