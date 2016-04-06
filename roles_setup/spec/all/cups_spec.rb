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

describe port(631) do
  it { should be_listening }
end

describe command('curl http://127.0.0.1:631/') do
  its(:stdout) { should match /printers/ }
end

