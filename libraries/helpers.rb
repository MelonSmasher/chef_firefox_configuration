module FirefoxConfiguration
  module Helpers

    def ensure_dir(path)
      directory path do
        action :create
        recursive true
      end
    end

  end
end
