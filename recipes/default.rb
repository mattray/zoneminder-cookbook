#
# Cookbook Name:: zoneminder
# Recipe:: default
#
# Copyright 2013-14, Chef Software, Inc.
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

package 'zoneminder'

# Following http://www.zoneminder.com/wiki/index.php/Documentation#Installation_from_a_.deb
# Most of those changes don't appear applicable with Ubuntu 12.04's package

# Link Apache
link "/etc/apache2/conf.d/zoneminder.conf" do
  to "/etc/zm/apache.conf"
end

# Restart Apache
execute "apache2ctl restart" do
  action :nothing
  subscribes :run, "link[/etc/apache2/conf.d/zoneminder.conf]"
end

