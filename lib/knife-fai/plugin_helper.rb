module KnifeGandi
  module PluginHelper
    def ensure_databag 
      begin
        rest.post_rest("data", { "name" => "hosts" })
        ui.info("Created data_bag[hosts]")
      rescue Net::HTTPServerException => e
        raise unless e.to_s =~ /^409/
        ui.info("Data bag hosts already exists")
      end
    end
  end
end
