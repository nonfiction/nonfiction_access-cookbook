# encoding: utf-8
require 'spec_helper'

# Write unit tests with ChefSpec - https://github.com/sethvargo/chefspec#readme
describe 'nonfiction_access::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'creates a nonfiction user' do
    expect(chef_run).to create_user('nonfiction')
  end

  # Adds /home/nonfiction/.ssh/
  it 'creates the nonfiction .ssh directory' do
    expect(chef_run).to create_directory('/home/nonfiction/.ssh')
  end

  # Adds /home/nonfiction/.ssh/authorized_keys
  it 'creates adds the nonfiction ssh keys' do
    expect(chef_run).to create_remote_file('/home/nonfiction/.ssh/authorized_keys')
  end
end
