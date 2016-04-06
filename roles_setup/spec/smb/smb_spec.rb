require 'spec_helper'

describe package('samba'), :if => os[:arch] == 'x86_64' do
  it { should be_installed }
end

describe service('smbd'), :if => os[:arch] == 'x86_64' do
  it { should be_enabled }
  it { should be_running }
end

describe port(139) do
  it { should be_listening }
  #puts os
end
