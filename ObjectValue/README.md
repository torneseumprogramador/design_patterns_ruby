# Padrão Object Value - Exemplo com Cliente e CPF

O padrão Object Value é um padrão de projeto que permite encapsular a lógica e validação de um determinado valor em um objeto específico. Nesse exemplo, vamos utilizar o padrão Object Value para as classes `Cliente` e `CPF`, garantindo que o CPF de um cliente seja uma entidade válida.

## Classe `Cliente`

A classe `Cliente` representa um cliente com atributos como `nome` e `cpf`. O construtor da classe recebe um `nome` e um `cpf`. O atributo `cpf` é definido como uma instância da classe `CPF`, assegurando que o CPF seja uma entidade válida.

### Atributos

- `nome`: O nome do cliente.
- `cpf`: O CPF do cliente.

## Classe `CPF`

A classe `CPF` é responsável pela validação e cálculo dos dígitos verificadores do CPF. Ela recebe o número do CPF como parâmetro em seu construtor e remove caracteres não numéricos. Em seguida, é feita a validação do CPF, levantando uma exceção caso seja inválido.

### Atributos

- `numero`: O número do CPF.

### Métodos

- `validar_cpf()`: Realiza a validação do CPF, levantando uma exceção se o CPF for inválido.
- `cpf_valido?()`: Verifica se os dígitos verificadores do CPF estão corretos.
- `calcular_digito_verificador(parcial)`: Calcula o dígito verificador do CPF com base em uma parte do número.

Esse exemplo demonstra como utilizar o padrão Object Value para encapsular a validação e cálculo dos dígitos verificadores do CPF em uma classe separada, proporcionando uma forma mais segura e coesa de lidar com essa informação.

Ao utilizar as classes `Cliente` e `CPF`, é possível garantir que o CPF de um cliente seja uma entidade válida e realizar operações com mais segurança em seu sistema.

Espero que essa explicação tenha sido útil para entender o padrão Object Value aplicado nas classes `Cliente` e `CPF`!


```ruby
class Cliente
  attr_accessor :nome, :cpf

  def initialize(nome, cpf)
    @nome = nome
    self.cpf = CPF.new(cpf)
  end

  def cpf=(cpf)
    if cpf.is_a?(CPF)
      @cpf = cpf
    else
      raise ArgumentError, "O CPF precisa ser uma instância da classe CPF"
    end
  end
end

class CPF
  attr_reader :numero

  def initialize(numero)
    @numero = numero.to_s.gsub(/\D/, '') # Remove caracteres não numéricos
    validar_cpf
  end

  def validar_cpf
    raise ArgumentError, "CPF inválido" unless cpf_valido?
  end

  def cpf_valido?
    return false if numero.length != 11

    digitos = numero.chars.map(&:to_i)
    dv1 = calcular_digito_verificador(digitos[0..8])
    dv2 = calcular_digito_verificador(digitos[0..8].append(dv1))

    digitos[9] == dv1 && digitos[10] == dv2
  end

  def calcular_digito_verificador(parcial)
    soma = 0
    multiplicador = parcial.length + 1

    parcial.each do |digito|
      soma += digito * multiplicador
      multiplicador -= 1
    end

    resto = soma % 11
    resto < 2 ? 0 : 11 - resto
  end
end
```