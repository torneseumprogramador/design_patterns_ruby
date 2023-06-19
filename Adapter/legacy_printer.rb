# Classe existente com interface incompatível
class LegacyPrinter
  def initialize(text)
    @text = text
  end

  def print_out
    puts "Imprimindo: #{@text}"
  end
end


# Nova interface esperada pelo cliente
class Printer
  def initialize(text)
    @text = text
  end

  def print
    raise NotImplementedError, "Esse método deve ser implementado pelas subclasses."
  end
end


# Implementação do Adapter
class PrinterAdapter < Printer
  def initialize(text)
    super
    @legacy_printer = LegacyPrinter.new(text)
  end

  def print
    @legacy_printer.print_out
    puts "Da minha adaptação sobre a classe principal"
  end
end


# Cliente que usa a nova interface
printer = PrinterAdapter.new("Olá, mundo!")
printer.print




require 'byebug'
debugger