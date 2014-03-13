module Finenso
  class Forex
    def topup_request(employee_name, amount)
      employee = Employee.find_by_name(employee_name)
      unless employee
        puts "#{employee_name} does not exist. Please make sure your employees.yml has #{employee_name}" unless employee
        return
      end
      eefc_account_number = employee["eefc_account_number"]
      card_number = employee["card_number"]
      first_name = employee["first_name"]
      body = <<-EOS
      To
      The Manager
      HDFC Bank Ltd
      100 Feet Road Branch,
      Bangalore - 560038


      Dear Sir,

      Subject: Transfer USD #{amount} from EEFC account to Forex card #{card_number}

      Requesting you to load the Forex card #{card_number} for #{first_name} using the EEFC account #{eefc_account_number} with USD #{amount} (USD #{amount.to_words.titleize}).

      Thanking you
      EOS
      Finenso::Letter.new.generate_pdf(body)
    end
  end
end
