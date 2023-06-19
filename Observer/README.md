# O Padrão Observer (Observador)

## Problema
Nós queremos construir um sistema que é altamente integrado, isso é, um sistema
onde cada parte é consciente do estado do todo.  Nós também querems que isso
seja manutenível, então nós deveríamos evitar acoplamento entre classes.

## Solução
Se nós quiseremos que algum componente (*observer*) tenha conhecimento sobre as
atividades de outro componente (sujeito), nós poderíamos simplesmente conectar
as duas classes e informar o primeiro sobre algumas ações executadas no segundo.
Isso significa que nós deveríamos passar uma referência para o observador quando
nós criamos o sujeito e chamar alguns de seus métodos quando o segundo muda. No
entanto, com essa abordagem estamos fazendo algo que nós queremos evitar,
aumento de acoplamento. Além disso, se nós quisermos informar algum outro
observador, nós teríamos que modificar a implementação do sujeito de modo que
ele notifique o novo observador, mesmo que nada tenha mudado. Uma abordagem
melhor seria manter uma lista dos objetos interessados nas mudanças do sujeito
e definir uma interface entre a fonte das novidades (o sujeito) e os
consumidores (os observadores). Dessa forma, sempre que houver uma mudança no
sujeito, nós apenas precisaríamos iterar sobre a lista de observadores,
notifica-os usando a interface que definimos.

## Exemplo
Vamos considerar um objeto `Employee`(funcionário) que tem uma propriedade
`salary` (salário). Nós gostaríamos de ser capaz de mudar o salário dele e
manter o sistema de folha de pagamentos informado sobre qualquer modificação.
O jeito mais simples de alcançar isso é passando uma referência para a
folha de pagamentos e informar sempre que nós modificarmos o salário do
funcionário:

```ruby
class Employee
  attr_reader :name, :title
  attr_reader :salary

  def initialize( name, title, salary, payroll)
    @name = name
    @title = title
    @salary = salary
    @payroll = payroll
  end

  def salary=(new_salary)
    @salary = new_salary
    @payroll.update(self)
  end
end
```

O problema é que, se nós quisermos notificar outro objeto (`TaxMan`, coletor de
impostos por exemplo), nós teríamos que modificar a classe Empregado. Isso
significa que outras classes estão guiando as mudanças para Empregado, mesmo que
nada tenha mudado nela. Vamos fornecer um jeito de manter uma lista de objetos
interessados nas mudanças de salário.

```ruby
class Employee
  attr_reader :name, :title
  attr_reader :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update(self)
    end
  end
end
```

Agora podemos usar o método `add_observer` para adicionar quantos objetos
quisermos para a lista de observadores e todos eles seriam notificados quando o
salário mudar.

```ruby
fred = Employee.new('Fred', 'Crane Operator', 30000.0)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary=35000.0
```

Mesmo sendo possível implementar esse padrão nós mesmos, a biblioteca padrão do
Ruby contém um módulo pré-construído que nos permite tornar qualquer um de
nossos objetos observáveis, nos libertando de termos que definir os mesmos
métodos em todos os lugares. Vamos refatorar a classe Empregado para usar o
módulo `Observable` (Observável):

```ruby
require 'observer'

class Employee
  include Observable

  attr_reader :name, :title
  attr_reader :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    changed
    notify_observers(self)
  end
end
```


# Outro exemplo:

# Padrão Observer - Exemplo de Envio de E-mails

Neste exemplo, vamos utilizar o padrão Observer para implementar o envio de e-mails em um sistema.

## Observers

### `EmailNotifier`

O observador `EmailNotifier` é responsável por enviar um e-mail de confirmação para o cliente.

#### Método `update(order)`

- `order` (Order): A instância do pedido que foi atualizada.

### `ShippingNotifier`

O observador `ShippingNotifier` é responsável por enviar um e-mail de notificação de envio para o cliente.

#### Método `update(order)`

- `order` (Order): A instância do pedido que foi atualizada.

## Subject (Observable)

### `Order`

A classe `Order` representa um pedido e atua como o subject (observable). Ela possui um atributo `customer_email` para armazenar o e-mail do cliente e um atributo `status` para representar o status do pedido.

#### Atributos

- `customer_email`: O e-mail do cliente.
- `status`: O status do pedido.

#### Métodos

- `attach(observer)`: Anexa um observador à lista de observadores do pedido.
- `detach(observer)`: Remove um observador da lista de observadores do pedido.
- `notify_observers()`: Notifica todos os observadores registrados quando o status do pedido é atualizado.
- `status=(new_status)`: Atualiza o status do pedido e notifica os observadores.

## Implementação
```ruby
# Observers
class EmailNotifier
  def update(order)
    puts "Enviando e-mail de confirmação para o cliente: #{order.customer_email}"
    # Lógica para enviar o e-mail de confirmação ao cliente
  end
end

class ShippingNotifier
  def update(order)
    puts "Enviando e-mail de notificação de envio para o cliente: #{order.customer_email}"
    # Lógica para enviar o e-mail de notificação de envio ao cliente
  end
end

# Subject (Observable)
class Order
  attr_accessor :customer_email, :status
  attr_reader :observers

  def initialize(customer_email)
    @customer_email = customer_email
    @observers = []
  end

  def attach(observer)
    observers << observer
  end

  def detach(observer)
    observers.delete(observer)
  end

  def notify_observers
    observers.each { |observer| observer.update(self) }
  end

  def status=(new_status)
    @status = new_status
    notify_observers
  end
end

# Exemplo de uso
order = Order.new("cliente@example.com")

email_notifier = EmailNotifier.new
shipping_notifier = ShippingNotifier.new

order.attach(email_notifier)
order.attach(shipping_notifier)

order.status = "confirmado"

order.detach(email_notifier)

order.status = "enviado"

```

## Exemplo de Uso

Aqui está um exemplo de uso do padrão Observer para o envio de e-mails:

```ruby
order = Order.new("cliente@example.com")

email_notifier = EmailNotifier.new
shipping_notifier = ShippingNotifier.new

order.attach(email_notifier)
order.attach(shipping_notifier)

order.status = "confirmado"

order.detach(email_notifier)

order.status = "enviado"
```

Neste exemplo, criamos uma instância da classe `Order` com um e-mail de cliente. Em seguida, anexamos os observadores `EmailNotifier` e `ShippingNotifier` ao pedido. Ao atualizar o status do pedido para "confirmado" e "enviado", os observadores são notificados e realizam suas respectivas ações de envio de e-mails.

Essa implementação do padrão Observer permite a flexibilidade de adicionar, remover e notificar observadores de forma dinâmica, garantindo a separação de responsabilidades entre o subject e os observadores.
