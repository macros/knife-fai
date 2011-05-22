#
# Author:: Jason Cook (<jasonc@simpleideas.org>)
# Copyright:: Copyright (c) 2011 Jason Cook
# License:: Apache License, Version 2.0
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

require 'chef/knife'

class Chef
  class Knife
    class FaiList < Knife

      deps do
        require 'knife-fai'
        require 'chef/data_bag'
      end

      banner "knife fai list (options)"

      option :subnet,
      :short => "-S SUBNET",
      :long => "--subnet SUBNET",
      :proc => Proc.new { |f| Chef::Config[:knife][:fai_subnet] = f.to_i }

      attr_reader :subnet

      def run
        display = format_list_for_display(Chef::DataBag.load('hosts'))
        output(display)
      end
    end
  end
end
