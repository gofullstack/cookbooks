#
# Cookbook Name:: graylog2
# Recipe:: apache2
#
# Copyright 2010, Medidata Solutions Inc.
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

# Install graylog2 web-interface
include_recipe "graylog2::web-interface"

# Install apache2 using the cookbook.
include_recipe "apache2"

# Install apache mod-passenger (NOTE: This should be added to base apache2 cookbook, but keeping it
#    here allows the use of the 'vanilla' Opscode apache2 cookbook which doesn't have a mod_passenger.rb
#    recipe. This should be compatible with the above, since the Opscode cookbook uses apt to install
#    apache.
package "libapache2-mod-passenger" do
  action :install
end

# Install template apache vhost config
template "apache-vhost-conf" do
  path "/etc/apache2/sites-available/graylog2"
  source "apache2-graylog2.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, 'service[apache2]'
end

# Add site using apache_site def
apache_site "graylog2" do
  enable
end

# Remove default site, if enabled
apache_site "000-default" do  # seems to have this value on Ubuntu default installs?
  enable false
end
apache_site "default" do  # seems to have this value on Ubuntu default installs?
  enable false
end