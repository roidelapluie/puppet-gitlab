class gitlab::repository{
  case $::osfamily {
    'Debian': {
      fail("$::osfamily is not supported by that module. Merge requests accepted.")
    }
    'RedHat': {
      yumrepo{
        $::gitlab::repository_name:
          gpgcheck => $::gitlab::repository_gpgcheck,
          gpgkey   => $::gitlab::repository_gpgkey,
          enabled  => $::gitlab::repository_enabled,
          baseurl  => $::gitlab::repository_url,
          descr    => $::gitlab::repository_descr,
      }

      Yumrepo[$::gitlab::repository_name] -> Package['gitlab']

    }
    default: {
      fail("$::osfamily is not supported by that module. Merge requests accepted.")
    }
  }
}
