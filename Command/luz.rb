# Receiver
class Light
  def on
    puts "Luz ligada"
  end

  def off
    puts "Luz desligada"
  end
end


sistema para arduino, preciso guardar no banco de dados
a sequencia de luz que acende e apaga

Acende, apaga, apaga, paga, acende


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
