*** Settings ***
Documentation    Exercício 5 IF e Loops
Library    SeleniumLibrary

*** Variable ***
@{Numeros}   0  2  3  5  6  8  9  10  12  15

*** Test Case ***
Teste exemplo 01
  Realizando a contagem dos Números

*** Keywords ***
Realizando a contagem dos Números
  Log to Console  ${\n}

  FOR    ${COUNT}  IN  @{Numeros}
        IF    ${COUNT} == 5    
              Log to Console  Eu sou o número 5!
        ELSE IF  ${COUNT} == 10
              Log to Console  Eu sou o número 10!
        ELSE
              Log To Console    Número diferente de 5 e 10!
        END
        
    END
         
Rodando uma keyword dada uma condição = false
    Run Keyword Unless  '${FRUTAS[1]}' == 'maça'        Log   O item número 1 não é uma maça!!

Armazenando um valor em uma variável dada uma condição
    ${VAR}     Set Variable If   '${FRUTAS[2]}' == 'uva'     uva
    Log        Minha variável VAR é uma ${VAR}!!