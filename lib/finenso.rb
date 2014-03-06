require "prawn"

module Finenso
  module Forex
    class Topup
      def generate_pdf
        Prawn::Document.generate("letter.pdf")
      end
    end
  end
end
