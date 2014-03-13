require File.expand_path("../lib/finenso.rb", __FILE__)

desc "Generate pdf for forex topup"
task :forex_topup, [:employee, :amount] do |t, args|
  if verify(args[:employee], "Missing employee argument.") && verify(args[:amount], "Missing amount to be credited.")
    Finenso::Forex.new.topup_request(args[:employee], args[:amount].to_i)
  end
end

def verify(option, msg)
  if option
    true
  else
    puts msg
    false
  end
end
