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
    class FaiCreate < Knife

      deps do
        require 'knife-fai'
        require 'chef/data_bag_item'
      end

      banner "knife fai create [HOST] (options)"

      option :ip,
      :short => "-i IP",
      :long => "--ip IP",
      :description => "Host ip address"

      option :mac,
      :short => "-m MACADDR",
      :long => "--mac MACADDR",
      :description => "Host mac address"

      option :fai_class,
      :short => "-c CLASS",
      :long => "--class CLASS",
      :description => "FAI CLASS",
      :default => "FAIBASE"

      def run
        ensure_databag()
        @data_bag_item_name = @name_args[0]
        if @data_bag_item_name
          create_object({ "id" => @data_bag_item_name }, "data_bag_item[#{@data_bag_item_name}]") do |output|
            item = Chef::DataBagItem.from_hash(output)
            item.data_bag('hosts')
            rest.post_rest("data/hosts", item)
          end
        end
      end
    end
  end
end
