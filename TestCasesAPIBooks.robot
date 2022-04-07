*** Settings ***
Documentation  Documentação da API:  https://fakerestapi.azurewebsites.net/api/v1/Activities
Resource         ResourceAPI.robot
Suite Setup      Conectar a minha API

*** Test Cases ***
Buscar a Listagem de todos os livros (GET em todos os livros)
  Requisitar todos os livros
  Conferir o status code  200
  Conferir o reason  OK
  Conferir se retorna uma lista de 200 livros