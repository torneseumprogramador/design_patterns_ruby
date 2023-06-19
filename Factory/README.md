## Factory em Ruby - Exemplo de Cliente

Neste exemplo, vamos explorar o conceito de Factory em Ruby, utilizando a classe `Cliente` como exemplo.

### Classe Cliente

A classe `Cliente` representa um cliente com propriedades como nome e email. Ela possui um construtor para inicializar essas propriedades e um método `exibir_informacoes` para mostrar os detalhes do cliente.

```ruby
class Cliente
  attr_accessor :nome, :email

  def initialize(nome, email)
    @nome = nome
    @email = email
  end

  def exibir_informacoes
    puts "Nome: #{nome}"
    puts "Email: #{email}"
  end
end
```

### Factory - ClienteFactory

A Factory, chamada `ClienteFactory`, é responsável por criar instâncias da classe `Cliente`. Ela possui um método estático `criar_cliente` que recebe o nome e o email do cliente e retorna uma nova instância da classe `Cliente`.

```ruby
class ClienteFactory
  def self.criar_cliente(nome, email)
    Cliente.new(nome, email)
  end
end
```

### Exemplo de uso

Vamos utilizar a `ClienteFactory` para criar um novo cliente chamado "João" com o email "joao@example.com" e exibir suas informações.

```ruby
cliente = ClienteFactory.criar_cliente("João", "joao@example.com")
cliente.exibir_informacoes
```

Neste exemplo, a `ClienteFactory` encapsula a lógica de criação de objetos da classe `Cliente`, permitindo criar instâncias de forma mais flexível e isolada. Ao utilizar a Factory, podemos criar clientes de maneira mais simplificada, sem a necessidade de conhecer os detalhes internos da classe `Cliente`.

Através do uso do método `criar_cliente` da `ClienteFactory`, podemos criar novos objetos da classe `Cliente` sem a necessidade de chamar diretamente o construtor da classe, tornando o código mais legível e de fácil manutenção.

