# == Class: roles::openstack::pmlc_controller
#
# This is a role class. It is to be assigned (1 per server)
# to a system as its classification on what it does.
# Role classes only include profile classes. No org-specific
# lookups or anything like that. Includes only.
#
# This particular role is for an openstack controller using
# the masterless preliminary mirantis lifecycle management.
#
# === Authors
#
# Scott Brimhall <sbrimhall@mirantis.com>
#
# === Copyright
#
# Copyright 2015 Mirantis Inc, unless otherwise noted.
#
class roles::openstack::pmlc_controller {

  include ::profiles::ntp::client
  include ::profiles::common::users
  include ::profiles::common::packages
  include ::profiles::ssh::server
  include ::profiles::openstack::keystone
  include ::profiles::openstack::nova::controller
  include ::profiles::openstack::neutron::server
  include ::profiles::openstack::cinder

  # Order classes in the order we want them applied
  Class['::profiles::ntp::client'] ->
  Class['::profiles::common::users'] ->
  Class['::profiles::common::packages'] ->
  Class['::profiles::ssh::server'] ->
  Class['::profiles::openstack::keystone'] ->
  Class['::profiles::openstack::nova::controller'] ->
  Class['::profiles::openstack::neutron::server'] ->
  Class['::profiles::openstack::cinder']

}
