class Finenso::EnvInitializer
  def self.load_env_vars
    YAML.load(File.open(settings_file)).
        each_with_object(ENV) {|(key, value), env| env[key.upcase] ||= value }
  end

  def self.settings_file
    File.join(Finenso.config.data_dir, "application.yml")
  end
end
