describe command ('cat /etc/resolv.conf') do 
  its (:stdout) {should include '127.0.1.1' }
end
