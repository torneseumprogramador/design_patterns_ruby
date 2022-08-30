class Marca < ApplicationRecord
  include NomeFiltro

  # require 'nome_pattern_validator.rb'
  validates :nome, nome_pattern: true
end
