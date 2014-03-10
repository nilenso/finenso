module Finenso
  class Forex
    def topup_request
      data_dir = File.expand_path("../../../data", __FILE__)
      topup_request_file = File.join(data_dir, "topup_request.csv")
      CSV.foreach(topup_request_file, :col_sep => ",", headers: true) do |row|
        eefc_account_number = row[0]
        card_number = row[1]
        card_holder_name = row[2]
        amount = row[3].to_i
        body = <<-EOS
        To
        The Manager
        HDFC Bank Ltd
        100 Feet Road Branch,
        Bangalore - 560038


        Dear Sir,

        Subject: Transfer USD #{amount} from EEFC account to Forex card #{card_number}

        Requesting you to load the Forex card #{card_number} for #{card_holder_name} using the EEFC account #{eefc_account_number} with USD #{amount} (USD #{amount.to_words.titleize}).

        Thanking you
        EOS
        Finenso::Letter.new.generate_pdf(body)
      end
    end
  end
end
