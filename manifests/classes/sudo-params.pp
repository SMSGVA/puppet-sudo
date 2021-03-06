class sudo::params {

  $release_version = $operatingsystem ? {
    RedHat => $lsbdistcodename ? {
      /^Nahant.*/        => '1.6.7',
      /Tikanga|Santiago/ => '1.7.2',
    },
    Debian => $lsbdistcodename ? {
      lenny   => '1.6.9',
      squeeze => '1.7.4',
    },
    CentOS => $lsbdistrelease ? {
      5.5 => '1.7.2',
    },
  }

  if !$sudo_version { 
    $version = "present" 
    $majversion = $release_version
  } else {
    $majversion = $sudo_version
    $version = $sudo_version
  }

}
