module Finenso
  class Employee
    def self.find_by_name(name)
      employees[name]
    end

    def self.employees
      @employees ||= YAML.load(File.open(employees_file))
    end

    def self.employees_file
      File.join(Finenso.config.data_dir, "employees.yml")
    end
  end
end
