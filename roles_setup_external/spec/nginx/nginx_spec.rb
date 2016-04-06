require 'spec_helper'

describe package('nginx'), :if => [ 'ubuntu','debian','linuxmint'].include?(os[:family]) do
  it { should be_installed }
end

describe file ('/etc/nginx/sites-enabled/default') do
  it { should be_symlink }
end

describe file ('/etc/nginx/sites-available/default') do
  it { should contain 'listen 80 default_server'}
end

describe service('nginx'), :if => [ 'ubuntu','debian','linuxmint'].include?(os[:family]) do
  it { should be_enabled }
  it { should be_running }
end

describe command ('nginx -t') do
  its(:stderr){ should match /syntax is ok/}
end

port_var="#{$node_property[:nginx_server_port]}"
describe port(port_var) do
  it { should be_listening }
  #puts "PORT VAR: #{$node_property[:nginx_server_port]}"
end
