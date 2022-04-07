*** Settings ***
Resource  			../Robot/Resource.robot
Test Setup  		Abrir navegador
Test Teardown  		Fechar navegador

*** Variables ***
${URL}  http://automationpractice.com
${BROWSER}  firefox

*** Test Case ***
Cenário 01: Pesquisar produto existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "itemNãoExistente"
  Então a página deve exibir a mensagem "No results were found for your search"

*** Keywords ***
Dado que estou na página home do site
  Acessar a página home do site
Quando eu pesquisar pelo produto "${Produto}"
  Digitar o nome do produto "${Produto}" no campo de pesquisa
  Clicar no botão pesquisar
Então o produto "${Produto}" deve ser listado na página de resultado da busca
  Conferir se o produto "${Produto}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
  Conferir mensagem de erro "${MENSAGEM_ALERTA}"