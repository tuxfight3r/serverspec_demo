require 'spec_helper'

describe file('/tmp/rspec_test.txt') do
  it { should be_file }
  its(:content) { should match /ServerName #{RSpec.configuration.host}/ }
end
