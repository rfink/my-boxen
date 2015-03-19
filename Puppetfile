# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.10.2"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "apache",      "0.0.2", :repo => "mattheath/puppet-apache"
github "autoconf",    "1.0.0"
github "better_touch_tools", "3.0.0"
github "brewcask",    "0.0.6"
github "chrome",      "1.2.0"
github "dnsmasq",     "2.0.1"
github "docker",      "0.9.0"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0"
github "git",         "2.7.5"
github "go",          "2.1.0"
github "homebrew",    "1.11.2"
github "hub",         "1.4.0"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "iterm2",      "1.2.4"
github "java",        "1.6.0"
github "libpng",      "1.0.0"
github "libtool",     "1.0.0"
github "mongodb",     "1.3.3"
github "mysql",       "1.99.992"
github "nginx",       "1.4.4"
github "nodejs",      "4.0.0"
github "nsq",         "1.0.1"
github "nvm",         "1.0.0"
github "openssl",     "1.0.0"
github "pcre",        "1.0.0"
github "phantomjs",   "2.3.0"
github "php",         "1.2.6"
github "pkgconfig",   "1.0.0"
github "pycharm",     "1.0.4"
github "python",      "2.0.0"
github "redis",       "3.1.0"
github "repository",  "2.3.0"
github "ruby",        "8.1.7"
github "sequel_pro",  "1.0.1"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "webstorm",    "1.1.1"
github "wget",        "1.0.1"
github "xquartz",     "1.2.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
