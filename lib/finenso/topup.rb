module Finenso
  class Forex
    def topup_request
      Finenso::Letter.new.generate_pdf
    end
  end
end
