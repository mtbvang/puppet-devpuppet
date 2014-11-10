# == Class devpuppet::service
#
# This class is meant to be called from devpuppet
# It ensure the service is running
#
class devpuppet::service {

  service { $::devpuppet::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
