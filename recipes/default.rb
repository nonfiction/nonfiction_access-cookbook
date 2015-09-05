# encoding: utf-8
#
# Cookbook Name:: nonfiction_access
# Recipe:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Add nonfiction users.
node['users'].each do |u|
  user u do
    supports :manage_home => true # rubocop:disable HashSyntax
    home "/home/#{u}"
    shell '/bin/bash'
    action :create
  end
end

# Create ssh directories.
node['users'].each do |u|
  directory "/home/#{u}/.ssh" do
    user u
    group u
    mode 00700
    action :create
  end
end

# Add our current keys.
node['users'].each do |u|
  remote_file "/home/#{u}/.ssh/authorized_keys" do
    source 'https://raw.github.com/nonfiction/keys/master/keys'
    owner u
    group u
    mode 00600
    action :create
  end
end

# Add sudoers files to /etc/sudoers.d/
node['users'].each do |user|
  sudo user do
    user      user
    nopasswd  true
  end
end

group 'nonfiction' do
  members node['users']
  action :create
end
