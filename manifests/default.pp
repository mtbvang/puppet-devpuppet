import 'init.pp'
import 'params.pp'
import 'install.pp'
import 'service.pp'

Exec {
  path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usr/local/bin"] }

class { 'devpuppet':
  user     => 'vagrant',
  userHome => '/home/vagrant'
}