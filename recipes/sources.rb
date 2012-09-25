#
# Cookbook Name:: mono
# Recipe:: source
#
# Author:: Guilhem Lettron (<guilhem.lettron@youscribe.com>)
#
# Copyright 2009-2011, Opscode, Inc.
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

include_recipe "build-essential"
include_recipe "git"

installation_dir = "/usr/local/src/mono"

packages = value_for_platform(
    "default" => [ 'zlib1g-dev', 'autoconf', 'automake']
  )

packages.each do |devpkg|
  package devpkg
end

git installation_dir do
	repository "https://github.com/mono/mono.git"
	reference node[:mono][:branch]
	action :sync
end

bash "compile_mono_source" do
	user "root"
	cwd installation_dir
	code <<-EOH
		./autogen.sh --prefix=#{node[:mono][:prefix]}
		make get-monolite-latest && make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe &&	make install
	EOH
end
