require 'spec_helper'

describe default_gateway do 
  its (:ipaddress) { should eq "#{$node_property[:default_gateway]}" }
  its (:interface) { should eq 'eth0' }
end

describe "routing table check for default gateway" do
  describe routing_table do
    it do
      should have_entry(
        :destination => 'default',
        :interface   => 'eth0',
        :gateway     => '10.0.2.2',
      )
    end
  end
end

describe "routing table check for 192.168.10.0/24" do
  describe routing_table do
    it do
      should have_entry(
        :destination => '192.168.10.0/24',
        :interface   => 'eth0',
        :gateway     => '10.0.2.2',
      )
    end
  end
end
