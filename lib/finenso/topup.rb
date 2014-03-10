module Finenso
  class Forex
    def topup_request(card_number, amount, card_holder_name, eefc_account)
      body = <<-EOS
To
The Manager
HDFC Bank Ltd
100 Feet Road Branch,
Bangalore - 560038


Dear Sir,

Subject: Transfer USD #{amount} from EEFC account to Forex card #{card_number}

Requesting you to load the Forex card #{card_number} for #{card_holder_name} using the EEFC account #{eefc_account} with USD #{amount} (USD #{amount.to_words.titleize}).

Thanking you
EOS
      Finenso::Letter.new.generate_pdf(body)
    end
  end
end
