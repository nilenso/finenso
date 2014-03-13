require 'spec_helper'

describe Finenso::Employee do
  it "finds the employee by name" do
    expect(Finenso::Employee).to receive(:employees_file).and_return(fixture_file("employees.yml"))
    employee = Finenso::Employee.find_by_name("oogabooga")
    expect(employee["first_name"]).to eq("Ooga")
    expect(employee["last_name"]).to eq("Booga")
    expect(employee["card_number"]).to eq("6753-2322-2322-5566")
    expect(employee["eefc_account_number"]).to eq("889604")
  end
end
