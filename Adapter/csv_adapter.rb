# Classe existente com interface incompatível
class LegacyCSVImporter
  def import(csv_file)
    # Lógica para importar o arquivo CSV
    puts "Importando arquivo CSV: #{csv_file}"
  end
end
  
# Nova interface esperada pelo cliente
class CSVImporter
  def import(file_path)
    raise NotImplementedError, "Esse método deve ser implementado pelas subclasses."
  end
end

# Implementação do Adapter
class CSVImporterAdapter < CSVImporter
  def import(file_path)
    legacy_importer = LegacyCSVImporter.new
    legacy_importer.import(file_path)
    # enviar os dados por email
  end
end

# Cliente que usa a nova interface
importer = CSVImporterAdapter.new
importer.import("dados.csv")
  