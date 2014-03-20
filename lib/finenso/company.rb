class Finenso::Company
  attr_reader :name, :quickbooks_id

  def initialize(name, quickbooks_id)
    @name = name
    @quickbooks_id = quickbooks_id
  end

  def accounts_service
    Finenso::QuickbooksClient.new.accounts_service_for(quickbooks_id)
  end

  def eefc_account
    accounts_service.query("Select * from Account where Name='EEFC'").entries.first
  end

  def eefc_account_balance
    eefc_account.current_balance_with_sub_accounts
  end

  def sufficient_eefc_account_balance?(amount)
    BigDecimal(amount) < eefc_account_balance
  end

  def self.find_by_identifier(identifier)
    companies[identifier]
  end

  def self.companies
    @companies ||= YAML.load(File.open(companies_file)).
                        each_with_object({})  do |(company_identifier, company_values_hash), acc|
                          acc[company_identifier] ||= Finenso::Company.new(company_values_hash["name"], company_values_hash["quickbooks_id"])
                        end
  end

  def self.companies_file
    File.join(Finenso.config.data_dir, "companies.yml")
  end

  def self.nilenso
    Finenso::Company.find_by_identifier("nilenso")
  end
end
