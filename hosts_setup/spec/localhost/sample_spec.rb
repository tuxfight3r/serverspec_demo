require 'spec_helper'

describe package('nginx'), :if => [ 'ubuntu','debian','linuxmint'].include?(os[:family]) do
  it { should be_installed }
end

describe service('nginx'), :if => [ 'ubuntu','debian','linuxmint'].include?(os[:family]) do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe "localhost" do
  include_examples 'files::init'
  include_examples 'cups::init'
end
