# == Class: devpuppet
#
# Full description of class devpuppet here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class devpuppet (
  $package_name = $::devpuppet::params::package_name,
  $service_name = $::devpuppet::params::service_name,
) inherits ::devpuppet::params {

  # validate parameters here

  class { '::devpuppet::install': } ->
  class { '::devpuppet::config': } ~>
  class { '::devpuppet::service': } ->
  Class['::devpuppet']
}
