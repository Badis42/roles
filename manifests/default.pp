# == Class: roles::default
#
# This is a role class. It is to be assigned (1 per server)
# to a system as its classification on what it does.
# Role classes only include profile classes. No org-specific
# lookups or anything like that. Includes only.
#
# This particular role is a default generic role that will
# configure the Puppet agent, users, configure sudo access,
# and ensure some basic default packages are installed
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class roles::default {

  include ::profiles::yum::default
  include ::profiles::puppet::agent
  include ::profiles::ntp::client
  include ::profiles::common::users
  include ::profiles::common::sudo
  include ::profiles::common::packages
  include ::profiles::ssh::server
  include ::profiles::firewall::purge
  include ::profiles::firewall::default

  Class['::profiles::yum::default'] ->
  Class['::profiles::puppet::agent'] ->
  Class['::profiles::ntp::client'] ->
  Class['::profiles::common::users'] ->
  Class['::profiles::common::sudo'] ->
  Class['::profiles::common::packages'] ->
  Class['::profiles::ssh::server'] ->
  Class['::profiles::firewall::purge'] ->
  Class['::profiles::firewall::default']

}
