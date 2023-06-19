## Adapter para Importação de Arquivos CSV em Ruby

O padrão Adapter é aplicado neste exemplo para permitir a integração de uma classe existente, `LegacyCSVImporter`, com uma nova interface, `CSVImporter`, em um sistema que realiza a leitura e importação de arquivos CSV em Ruby.

A classe `LegacyCSVImporter` representa a classe existente com uma interface incompatível, contendo a lógica para importar o arquivo CSV. A classe `CSVImporter` define a nova interface esperada pelo cliente, com o método `import(file_path)`.

O adaptador, `CSVImporterAdapter`, herda da classe `CSVImporter` e atua como uma camada intermediária. Ele se comunica com a classe `LegacyCSVImporter`, utilizando a lógica de importação existente, para realizar a importação do arquivo CSV.

Ao utilizar o padrão Adapter, é possível utilizar a nova interface `CSVImporter` para importar arquivos CSV, mesmo que a classe `LegacyCSVImporter` possua uma interface incompatível. O cliente cria uma instância do `CSVImporterAdapter` e chama o método `import` para importar o arquivo CSV.

```ruby
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
  end
end

# Cliente que usa a nova interface
importer = CSVImporterAdapter.new
importer.import("dados.csv")
```

Este exemplo demonstra o conceito do padrão Adapter, mas em uma aplicação real, você precisaria adicionar lógica adicional, como a leitura do arquivo CSV e o processamento dos dados.

Certifique-se de adaptar o exemplo para a linguagem de programação que você está utilizando.