require 'spec_helper'

describe package('cups-daemon') do
  it { should be_installed }
end

describe service('cups') do
  it { should be_enabled   }
end

describe service('cupsd') do
  it { should be_running   }
end

port_var="#{$node_property[:cups_server_port]}"
describe port(port_var) do
  it { should be_listening }
end

describe command("curl http://127.0.0.1:#{port_var}/") do
  its(:stdout) { should match /printers/ }
end

