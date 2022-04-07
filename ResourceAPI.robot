*** Settings ***
Documentation  Documentação da API:  https://fakerestapi.azurewebsites.net/api/v1/Activities
Library  RequestsLibrary
Library  Collections

*** Variables ***
${URL_API}  https://fakerestapi.azurewebsites.net/api

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
  Create Session    fakeAPI    ${URL_API}

####Ações
Requisitar todos os livros
  ${AUTHORS}  Get Request    fakeAPI    Activities
  Log           ${AUTHORS.text}
  Set Test Variable    ${AUTHORS}

Conferindo o status code
  [Arguments]     ${STATUSCODE_DESEJADO}
  Should Be Equal As Strings    ${AUTHORS.status_code}    ${STATUSCODE_DESEJADO}

Conferindo o reason
  [Arguments]     ${REASON_DESEJADO}
  Should Be Equal As Strings    ${AUTHORS.reason}    ${REASON_DESEJADO}
  Should Be Empty    item
Conferir se retorna uma lista de ${QTDE_LIVROS} livros
  Length Should Be    ${AUTHORS.json()}    ${QTDE_LIVROS}
  