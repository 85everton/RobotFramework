*** Settings ***
Resource  			../Robot/Resource.robot
Test Setup  		Abrir navegador
Test Teardown  		Fechar navegador

### SETUP ele roda keyword antes da suite ou antes de um teste
### TEARDOWN ele roda keyword depois da suite ou de um teste

*** Test Case ***
#Cenário 01: Pesquisar produto existente
 # Acessar a página home do site
  #Digitar o nome do produto "Blouse" no campo de pesquisa
  #Clicar no botão pesquisar
  #Conferir se o produto "Blouse" foi listado no site

#Cenário 02: Pesquisar produto não existente
 # Acessar a página home do site
  #Digitar o nome do produto "itemNãoExistente" no campo de pesquisa
  #Clicar no botão pesquisar
  #Conferir mensagem de erro "No results were found for your search"itemNãoExistente

#Cenário 03: Listar Produtos
  #Acessar a página home do site
  #Passar o mouse por cima da categoria "Women" no menu principal superior de categorias.
  #Clicar na sub categoria "Summer Dresses"

#Cenário 04: Adicionar Produtos no Carrinho
  #Acessar a página home do site
  #Digitar o nome do produto "t-shirt" no campo de pesquisa
  #Clicar no botão pesquisar
  #Clicar no botão "Add to cart" do produto
  #Clicar no botão "Proceed to checkout"

#Cenário 05: Remover Produtos
  #Acessar a página home do site
  #Digitar o nome do produto "t-shirt" no campo de pesquisa
  #Clicar no botão pesquisar
  #Clicar no botão "Add to cart" do produto
  #Clicar no botão "Proceed to checkout"
  #Clicar no ícone carrinho de compras no menu superior direito
  #Clicar no botão de remoção de produtos (delete) no produto do carrinho.

Cenário 06: Adicionar Cliente
  Acessar a página home do site
  Clicar no botão superior direito “Sign in”
  Inserir um e-mail válido
  Clicar no botão "Create na account"
  Preencher os campos obrigatórios
  Clicar em "Register"para finalizar o cadastro.