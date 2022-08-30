module NomeFiltro
  extend ActiveSupport::Concern

  included do
    scope :nome_filtro, -> { where(nome: "ddd") }
  end

  class_methods do
    def um_teste
      puts "==========="
    end
  end
end