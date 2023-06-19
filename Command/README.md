## Exemplo do Padrão Command em Ruby

Neste exemplo, demonstraremos a implementação do padrão Command em Ruby.

```ruby
# Receiver
class Light
  def on
    puts "Luz ligada"
  end

  def off
    puts "Luz desligada"
  end
end

# Command interface
class Command
  def execute
    raise NotImplementedError, "Esse método deve ser implementado pelas subclasses."
  end
end

# Concrete Command
class LightOnCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.on
  end
end

# Concrete Command
class LightOffCommand < Command
  def initialize(light)
    @light = light
  end

  def execute
    @light.off
  end
end

# Invoker
class RemoteControl
  def initialize
    @commands = []
  end

  def add_command(command)
    @commands << command
  end

  def execute_commands
    @commands.each(&:execute)
  end
end

# Client
light = Light.new

light_on_command = LightOnCommand.new(light)
light_off_command = LightOffCommand.new(light)

remote_control = RemoteControl.new
remote_control.add_command(light_on_command)
remote_control.add_command(light_off_command)

remote_control.execute_commands
```

Neste exemplo, temos uma classe `Light` que atua como o "Receiver", que contém os métodos `on` e `off` para ligar e desligar uma luz.

A classe abstrata `Command` define a interface para todos os comandos, com um método `execute` que deve ser implementado pelas subclasses concretas. Neste caso, temos duas subclasses concretas: `LightOnCommand` e `LightOffCommand`. Cada uma delas recebe uma instância de `Light` no construtor e implementa o método `execute` para chamar os métodos `on` e `off` do `Light`, respectivamente.

A classe `RemoteControl` atua como o "Invoker" e mantém uma lista de comandos. Ela possui os métodos `add_command` para adicionar um comando à lista e `execute_commands` para percorrer a lista e executar os comandos.

No cliente, criamos uma instância de `Light`, em seguida, instâncias de `LightOnCommand` e `LightOffCommand` são criadas, passando a instância de `Light` correspondente no construtor. Esses comandos são adicionados ao controle remoto (`RemoteControl`) usando o método `add_command`. Por fim, chamamos o método `execute_commands` no controle remoto para executar todos os comandos adicionados.

Ao executar o exemplo, veremos a saída "Luz ligada" e "Luz desligada".

O padrão Command permite encapsular uma solicitação como um objeto, permitindo parametrizar clientes com diferentes solicitações, fazer fila ou registrar solicitações em log e oferecer suporte a operações reversíveis.
