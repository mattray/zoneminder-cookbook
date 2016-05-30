#
# Cookbook Name:: zoneminder
# Recipe:: default
#
# Copyright 2013-2016, Chef Software, Inc.
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

apt_repository 'zoneminder' do
  uri          'ppa:iconnor/zoneminder'
  distribution node['lsb']['codename']
  only_if { node['platform'] == 'ubuntu' && node['zoneminder']['use_ppa'] }
  components %w(main)
end

package 'zoneminder'

package 'php-gd' do
  package_name node['platform_version'].to_i >= 16 ? 'php7.0-gd' : 'php5-gd'
end

execute 'a2enconf zoneminder' do
  not_if { ::File.exist?('/etc/apache2/conf-enabled/zoneminder')}
end

apache_module 'cgi'
apache_module 'rewrite'

# fix bad permissions from the PPA
file '/etc/zm/zm.conf' do
  mode '0640'
  user 'www-data'
  group 'www-data'
end

# Restart Apache
execute 'apache2ctl restart' do
  action :nothing
  subscribes :run, 'execute[a2enconf zoneminder]'
end
