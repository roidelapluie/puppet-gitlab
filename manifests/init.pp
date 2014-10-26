# == Class: gitlab
#
# Full description of class gitlab here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { gitlab:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class gitlab (
    $repository_url                                    = '',
    $manage_repository                                 = false,
    $repository_gpgcheck                               = '0',
    $repository_gpgkey                                 = undef,
    $repository_enabled                                = '1',
    $repository_url                                    = '',
    $repository_name                                   = 'gitlab',
    $repository_descr                                  = 'Gitlab Repository',

    $git_data_dir                                      = undef,
    $external_url                                      = undef,
    $postgresql_enable                                 = undef,
    $dir                                               = undef,
    $log_directory                                     = undef,
    $environment                                       = undef,
    $internal_api_url                                  = undef,
    $uploads_directory                                 = undef,
    $rate_limit_requests_per_period                    = undef,
    $rate_limit_period                                 = undef,
    $gitlab_host                                       = undef,
    $gitlab_port                                       = undef,
    $gitlab_https                                      = undef,
    $gitlab_email_from                                 = undef,
    $gitlab_support_email                              = undef,
    $gitlab_default_projects_limit                     = undef,
    $gitlab_default_can_create_group                   = undef,
    $gitlab_username_changing_enabled                  = undef,
    $gitlab_default_theme                              = undef,
    $gitlab_signup_enabled                             = undef,
    $gitlab_default_projects_features_issues           = undef,
    $gitlab_default_projects_features_merge_requests   = undef,
    $gitlab_default_projects_features_wiki             = undef,
    $gitlab_default_projects_features_wall             = undef,
    $gitlab_default_projects_features_snippets         = undef,
    $gitlab_default_projects_features_visibility_level = undef,
    $issues_tracker_redmine                            = undef,
    $issues_tracker_redmine_title                      = undef,
    $issues_tracker_redmine_project_url                = undef,
    $issues_tracker_redmine_issues_url                 = undef,
    $issues_tracker_redmine_new_issue_url              = undef,
    $issues_tracker_jira                               = undef,
    $issues_tracker_jira_title                         = undef,
    $issues_tracker_jira_project_url                   = undef,
    $issues_tracker_jira_issues_url                    = undef,
    $issues_tracker_jira_new_issue_url                 = undef,
    $gravatar_enabled                                  = undef,
    $gravatar_plain_url                                = undef,
    $gravatar_ssl_url                                  = undef,
    $ldap_enabled                                      = undef,
    $ldap_host                                         = undef,
    $ldap_base                                         = undef,
    $ldap_port                                         = undef,
    $ldap_uid                                          = undef,
    $ldap_method                                       = undef,
    $ldap_bind_dn                                      = undef,
    $ldap_password                                     = undef,
    $ldap_allow_username_or_email_login                = undef,
    $ldap_user_filter                                  = undef,
    $ldap_group_base                                   = undef,
    $satellites_path                                   = undef,
    $backup_path                                       = undef,
    $backup_keep_time                                  = undef,
    $gitlab_shell_path                                 = undef,
    $gitlab_shell_repos_path                           = undef,
    $gitlab_shell_hooks_path                           = undef,
    $gitlab_shell_upload_pack                          = undef,
    $gitlab_shell_receive_pack                         = undef,
    $gitlab_shell_ssh_port                             = undef,
    $git_bin_path                                      = undef,
    $git_max_size                                      = undef,
    $git_timeout                                       = undef,
    $db_adapter                                        = undef,
    $db_encoding                                       = undef,
    $db_database                                       = undef,
    $db_pool                                           = undef,
    $db_username                                       = undef,
    $db_password                                       = undef,
    $db_host                                           = undef,
    $db_port                                           = undef,
    $db_socket                                         = undef,
){

  if ($manage_repository){
    include ::gitlab::repository
  }

  include ::gitlab::config

  package {
    'gitlab':
      ensure => present,
      notify => Exec['gitlab-reconfigure'],
  }

  exec {'gitlab-reconfigure':
    command     => '/usr/bin/gitlab-ctl reconfigure',
    refreshonly => true,
  }

}
