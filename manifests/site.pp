require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include android::sdk
  include android::studio
  include apache
  include autoconf
  include awscli
  include better_touch_tools
  include chrome
  include docker
  include diffmerge
  include dnsmasq
  #include filezilla
  include git
  include go
  include hub
  include iterm2::stable
  include java
  include libpng
  include libtool
  include liteide
  include mongodb
  include mysql
  include nginx
  include nodejs
  include nsq
  include openssl
  include pcre
  include phantomjs
  include php::5_5
  include pycharm
  include r
  include rstudio
  include redis
  include sequel_pro
  include virtualbox
  include webstorm
  include wget

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node global modules
  nodejs::module { 'bower': node_version => 'v0.12.0' }
  nodejs::module { 'grunt-cli': node_version => 'v0.12.0' }
  nodejs::module { 'gulp': node_version => 'v0.12.0' }
  nodejs::module { 'duo': node_version => 'v0.12.0' }
  nodejs::module { 'retire': node_version => 'v0.12.0' }

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/my-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
