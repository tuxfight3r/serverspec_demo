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

describe "10.0.2.15" do
  include_examples 'files::init'
  include_examples 'cups::init'
end


