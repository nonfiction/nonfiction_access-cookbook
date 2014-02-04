# encoding: utf-8
require 'spec_helper'

# Write integration tests with Serverspec - http://serverspec.org/
describe 'nonfiction_access::default' do
  describe user('nonfiction') do
    it { should exist }
  end

  describe file('/home/nonfiction/.ssh/authorized_keys') do
    it { should be_file }
  end

  describe file('/etc/sudoers.d/nonfiction') do
    it { should be_file }
  end
end
