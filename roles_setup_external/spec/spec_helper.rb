require 'serverspec'
require 'spec_helper'
require 'net/ssh'
require 'yaml'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end

host = ENV['TARGET_HOST']
user = ENV['USER']

options = Net::SSH::Config.for(host)
options[:user] = "root" unless ENV['USER'].empty?
#options[:user] = ENV['USER']
options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options


base_spec_dir = Pathname.new(File.join(File.dirname(__FILE__)))
$properties=YAML.load_file(base_spec_dir.join('../properties.yml'))

# Return all ports for a given host
def props(host)
  if $properties.has_key?(host)
    if $properties[host].has_key?(:props)
      #get the default properties
      default_props=$properties["default"][:props]
      #merge with the properties for that host
      props=default_props.merge($properties[host][:props])
    else
      #send default properties
      props=$properties["default"][:props]
    end
  else
    #send default properties
    props=$properties["default"][:props]
  end
  props
end

$node_property=props(host)
#puts $node_property.to_yaml


#puts ENV['PORTS']
#ports_hash=ENV['PORTS'].to_a.map{ |pair| Hash[*pair] }.inject(&:merge)
#puts ports_hash

# Disable sudo
# set :disable_sudo, true


# Set environment variables
set :env, :LANG => 'C', :LC_MESSAGES => 'C' 

# Set PATH
set :path, '/sbin:/usr/local/sbin:$PATH'
#Dir["./spec/shared/**/*.rb"].sort.each { |f| require f}
