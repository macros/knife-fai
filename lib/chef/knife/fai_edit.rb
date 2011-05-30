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
    class FaiEdit < Knife

      deps do
        require 'knife-fai'
        require 'chef/data_bag_item'
      end

      banner "knife fai edit [HOST] (options)"

      def run
        @data_bag_item = @name_args[0]
        output = Chef::DataBagItem.load('hosts', @data_bag_item)
        host = edit_data(output.raw_data)
        output.raw_data = host
        rest.put_rest("data/hosts/#{@data_bag_item}", output)
        stdout.puts("Saved data_bag_item[#{@data_bag_item}]")
        output(format_for_display(output.raw_data))
      end
    end
  end
end
