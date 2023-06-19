## Exemplo de Construção de Pedido com Builder

Neste exemplo, ilustraremos a construção de um pedido utilizando o padrão de design Builder. Suponhamos que temos as entidades `Cliente`, `Pedido`, `Produto` e `PedidoProduto`.

A função `builder(texto)` é responsável por receber um texto e extrair informações relevantes, como o nome do cliente e os produtos do pedido. A partir dessas informações, ela constrói o objeto de `Pedido` completo.

```ruby
def builder(texto)
    nome, produtos = OpenAI.extrair(texto)

    cliente = Cliente.new(nome)
    produtos = Produto.where(nome: produtos)
    pedido = Pedido.new(cliente)
    pedido_produto = PedidoProduto.new(pedido, produtos)

    ## pedido pronto
    pedido
end
```


A função `builder` utiliza uma função fictícia `OpenAI.extrair(texto)` para extrair o nome do cliente e os nomes dos produtos do texto fornecido.

Em seguida, são criadas instâncias das entidades `Cliente`, `Produto`, `Pedido` e `PedidoProduto` para compor o pedido. O `Cliente` é instanciado com o nome obtido, os `Produtos` são obtidos do banco de dados com base nos nomes extraídos, e então o `Pedido` e `PedidoProduto` são criados com as instâncias correspondentes.

Por fim, o pedido completo é retornado pela função.

Abaixo, temos exemplos de chamadas ao método `builder`:


```ruby
# Chamada no controle 1
CriarPedido.builder("Olá sou o Danilo e quero comprar 5 bananas e 2 maçãs, me passe o valor total")

# Chamada no controle 2
CriarPedido.builder("Olá sou o Danilo e quero comprar 5 bananas e 2 maçãs, me passe o valor total")

# Chamada no controle 3
CriarPedido.builder("Olá sou o Danilo e quero comprar 5 bananas e 2 maçãs, me passe o valor total")
```

Nesses exemplos, o texto fornecido é processado pela função `builder` para construir um pedido com base nas informações do cliente e dos produtos.

O padrão Builder é utilizado nesse contexto para permitir a construção do objeto `Pedido` de forma flexível e passo a passo, isolando a lógica de construção em uma função separada.

Lembre-se de adaptar o exemplo para a linguagem de programação que você está utilizando.
