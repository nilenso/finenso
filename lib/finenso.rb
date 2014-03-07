require "prawn"

module Finenso
  module Forex
    class Topup
      ASSETS_DIR = File.expand_path("../../assets", __FILE__)
      OUTPUT_DIR = File.expand_path("../../target", __FILE__)
      def generate_pdf
        Prawn::Document.generate("#{OUTPUT_DIR}/letterhead.pdf") do
          image "#{ASSETS_DIR}/nilenso-bg.png", width: 220, at: [410, cursor + 110]
        end
      end
    end
  end
end
