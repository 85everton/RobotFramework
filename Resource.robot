*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}        firefox
${URL}            http://automationpractice.com

*** Keywords ***
#### Setup e teardown
Abrir navegador
    Open Browser    about:blank    ${BROWSER}

Fechar navegador
    Close Browser

#### Passo-a-Passo
Acessar a página home do site
  go to   http://automationpractice.com
  title should be  My Store

Digitar o nome do produto "${Produto}" no campo de pesquisa
   Input text  name=search_query  ${Produto}

Clicar no botão pesquisar
  Click Element  name=submit_search

Conferir se o produto "${Produto}" foi listado no site
  Wait Until Element Is Visible    css=#center_column > h1
  Title Should Be                  Search - My Store
  Page Should Contain Image        xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[1]/div/a[1]/img
  Page Should Contain Link         xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/h5/a

Conferir mensagem de erro "No results were found for your search"itemNãoExistente
  Wait Until Element Is Visible    css=html body#search.search.hide-right-column.lang_en p.alert.alert-warning
  Title Should Be                  Search - My Store

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias.
  Mouse Over                        xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a
  
Clicar na sub categoria "${CATEGORIA}"
  Wait Until Element Is Visible     xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/a
  Click Element                     xpath=/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/a
  Page Should Contain Element       xpath=//*[@id="center_column"]/ul/li/[1]/div/div[@title= ${Vestido[1]}]
  Page Should Contain Element       xpath=//*[@id="center_column"]/ul/li/[2]/div/div[@title= ${Vestido[1]}]
  Page Should Contain Element       xpath=//*[@id="center_column"]/ul/li/[3]/div/div[@title= ${Vestido[2]}]
  
Clicar no botão "Add to cart" do produto
  Mouse Over                         css=html body#search.search.hide-right-column.lang_en div#page div.columns-container div#columns.container div.row div#center_column.center_column.col-xs-12.col-sm-9 ul.product_list.grid.row li.ajax_block_product.col-xs-12.col-sm-6.col-md-4.first-in-line.last-line.first-item-of-tablet-line.first-item-of-mobile-line.last-mobile-line div.product-container div.left-block div.product-image-container a.product_img_link img.replace-2x.img-responsive
  Wait Until Element Is Visible      xpath =/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/div[2]/a[1]/span
  Click Element                      xpath=/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/div[2]/a[1]/span
Clicar no botão "Proceed to checkout"
  Wait Until Element Is Visible      xpath =/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a/span
  Click Element                      xpath=/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a/span

Clicar no ícone carrinho de compras no menu superior direito
  Click Element                     xpath=/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a
Clicar no botão de remoção de produtos (delete) no produto do carrinho.
  Wait Until Element Is Visible      xpath =/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[7]/div/a/i
  Click Element                      xpath=/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[7]/div/a/i

Clicar no botão superior direito “Sign in”
  Click Element                       xpath=/html/body/div/div[1]/header/div[2]/div/div/nav/div[1]/a
Inserir um e-mail válido
  #Wait Until Element Is Visible      xapth=//*[@id="email_create"]
  Input text                         xapth=//*[@id="email_create"]  automacao@framework.com
Clicar no botão "Create na account"
  Click Element                      xpath=/html/body/div/div[2]/div/div[3]/div/div/div[1]/form/div/div[3]/button/span
Preencher os campos obrigatórios
  Wait Until Element Is Visible      xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
  Click Element                      id=id_gender1        
  Input text                         id=customer_firstname  ${USUARIO.nome}
  Input text                         id=customer_lastname  ${USUARIO.sobre_nome}
  Input text                         id=passwd  ${USUARIO.senha}
  Input text                         xpath=//*[@id="address1"]  ${USUARIO.endereço}
  Input text                         xpath=//*[@id="city"]  ${USUARIO.cidade}
  Set Focus To Element               id=id_state    
  Input text                         xpath=//*[@id="id_state"]  "New York"
  Input text                         xpath=//*[@id="postcode"]  "13500-000"
  Input text                         xpath=//*[@id="phone_mobile"]  "19-99999-9999"
  Input text                         xpath=//*[@id="alias"]  "Rua 19 número 43"
Clicar em "Register"para finalizar o cadastro.
  Click Element                      xpath=/html/body/div/div[2]/div/div[3]/div/div/form/div[4]/button/span