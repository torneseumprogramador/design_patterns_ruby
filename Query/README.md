# Classe `Product` - Documentação

A classe `Product` representa um modelo de produto e utiliza o padrão Query para realizar consultas utilizando o Active Record no Rails.

## Implementação

```ruby
class Product < ApplicationRecord
end

class ProductQuery
  def initialize(produto)
    @produto = produto
  end

  def search_by_name(name)
    where("name ILIKE ?", "%#{name}%")
  end

  def price_greater_than(price)
    where("price > ?", price)
  end

  def category(category)
    where(category: category)
  end
end

```

## Métodos

### `search_by_name(name)`

Este método realiza uma busca por produtos com base no nome.

#### Parâmetros

- `name` (String): O nome a ser pesquisado nos produtos.

#### Retorno

Uma coleção de produtos que possuem o nome especificado, realizando uma busca case-insensitive.

### `price_greater_than(price)`

Este método realiza uma busca por produtos com preço maior do que o valor especificado.

#### Parâmetros

- `price` (Numeric): O valor mínimo do preço dos produtos a serem buscados.

#### Retorno

Uma coleção de produtos que possuem preço maior do que o valor especificado.

### `category(category)`

Este método realiza uma busca por produtos com base na categoria.

#### Parâmetros

- `category` (String): A categoria dos produtos a serem buscados.

#### Retorno

Uma coleção de produtos que possuem a categoria especificada.

## Exemplo de Uso

Aqui está um exemplo de uso dos métodos de consulta da classe `Product`:

```ruby
# Consulta por produtos cujo nome contenha "apple"
products = ProductQuery.new(Produto).search_by_name("apple")
products.each do |product|
  puts "#{product.name} - R$ #{product.price}"
end

# Consulta por produtos com preço maior que 50
products = ProductQuery.new(Produto).price_greater_than(50)
products.each do |product|
  puts "#{product.name} - R$ #{product.price}"
end

# Consulta por produtos da categoria "eletrônicos"
products = ProductQuery.new(Produto).category("eletrônicos")
products.each do |product|
  puts "#{product.name} - R$ #{product.price}"
end
```

Esse exemplo demonstra como utilizar os métodos de consulta da classe Product para buscar e filtrar produtos com base no nome, preço e categoria.

Certifique-se de ter uma tabela products no banco de dados e que a classe Product esteja definida dentro do diretório app/models em sua aplicação Rails.