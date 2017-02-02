module FirefoxConfiguration
  module Helpers

    def ensure_dir(path)
      directory path do
        action :create
        recursive true
      end
    end

    def create_template(source_template, path)
      template path do
        source source_template
      end
    end

  end
end
