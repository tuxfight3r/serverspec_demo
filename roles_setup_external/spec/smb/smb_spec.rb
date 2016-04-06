require 'spec_helper'

describe package('samba'), :if => os[:arch] == 'x86_64' do
  it { should be_installed }
end

describe service('smbd'), :if => os[:arch] == 'x86_64' do
  it { should be_enabled }
  it { should be_running }
end

port_var="#{$node_property[:smb_server_port]}"
describe port(port_var) do
  it { should be_listening }
  #puts os
end
