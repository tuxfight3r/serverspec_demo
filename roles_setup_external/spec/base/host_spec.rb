require 'spec_helper'

describe host ('updates.puppetlabs.com') do 
  it {should be_resolvable.by('host')}
end
