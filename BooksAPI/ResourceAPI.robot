*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/AUTHORSs
Library         RequestsLibrary
Library         Collections

*** Variable ***
# ${URL_API}      https://fakerestapi.azurewebsites.net/api/
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1
&{AUTHORS_15}      ID=15
...             Title=AUTHORS 15
...             PageCount=1500
&{AUTHORS_201}     ID=201
...             Title=Meu novo AUTHORS
...             Description=Meu novo AUTOR conta coisas fantásticas
...             PageCount=523
...             Excerpt=Meu Novo AUTOR é massa
...             PublishDate=2018-04-26T17:58:14.765Z
&{AUTHORS_150}     ID=150
...             Title=AUTHORS 150 alterado
...             Description=Descrição do AUTHORS 150 alteada
...             PageCount=600
...             Excerpt=Resumo do AUTHORS 150 alteado
...             PublishDate=2017-04-26T15:58:14.765Z

*** Keywords ***
####SETUP E TEARDOWNS
Conectar a minha API
    Create Session    fakeAPI    ${URL_API}
    ${HEADERS}     Create Dictionary    content-type=application/json
    Set Suite Variable    ${HEADERS}

#### Ações
Requisitar todos os AUTORs
    ${RESPOSTA}    Get Request    fakeAPI    AUTHORSs
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Requisitar o AUTOR "${ID_AUTOR}"
    ${RESPOSTA}    Get Request    fakeAPI    AUTHORSs/${ID_AUTOR}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Cadastrar um novo AUTOR
    ${RESPOSTA}    Post Request   fakeAPI    AUTHORSs
    ...                           data={"ID": ${AUTHORS_201.ID},"Title": "${AUTHORS_201.Title}","Description": "${AUTHORS_201.Description}","PageCount": ${AUTHORS_201.PageCount},"Excerpt": "${AUTHORS_201.Excerpt}","PublishDate": "${AUTHORS_201.PublishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Alterar o AUTOR "${ID_AUTOR}"
    ${RESPOSTA}    Put Request    fakeAPI    AUTHORSs/${ID_AUTOR}
    ...                           data={"ID": ${AUTHORS_150.ID},"Title": "${AUTHORS_150.Title}","Description": "${AUTHORS_150.Description}","PageCount": ${AUTHORS_150.PageCount},"Excerpt": "${AUTHORS_150.Excerpt}","PublishDate": "${AUTHORS_150.PublishDate}"}
    ...                           headers=${HEADERS}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

Excluir o AUTOR "${ID_AUTOR}"
    ${RESPOSTA}    Delete Request    fakeAPI    AUTHORSs/${ID_AUTOR}
    Log            ${RESPOSTA.text}
    Set Test Variable    ${RESPOSTA}

#### Conferências
Conferir o status code
    [Arguments]      ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUSCODE_DESEJADO}

Conferir o reason
    [Arguments]    ${REASON_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.reason}     ${REASON_DESEJADO}

Conferir se retorna uma lista com "${QTDE_AUTORS}" AUTORs
    Length Should Be      ${RESPOSTA.json()}     ${QTDE_AUTORS}

Conferir se retorna todos os dados corretos do AUTOR 15
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${AUTHORS_15.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${AUTHORS_15.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${AUTHORS_15.PageCount}
    Should Not Be Empty    ${RESPOSTA.json()["description"]}
    Should Not Be Empty    ${RESPOSTA.json()["excerpt"]}
    Should Not Be Empty    ${RESPOSTA.json()["publishDate"]}

Conferir se retorna todos os dados cadastrados do AUTOR "${ID_AUTOR}"
    Conferir AUTOR    ${ID_AUTOR}

Conferir se retorna todos os dados alterados do AUTOR "${ID_AUTOR}"
    Conferir AUTOR    ${ID_AUTOR}

Conferir AUTOR
    [Arguments]     ${ID_AUTOR}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    id              ${AUTHORS_${ID_AUTOR}.ID}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    title           ${AUTHORS_${ID_AUTOR}.Title}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    description     ${AUTHORS_${ID_AUTOR}.Description}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    pageCount       ${AUTHORS_${ID_AUTOR}.PageCount}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    excerpt         ${AUTHORS_${ID_AUTOR}.Excerpt}
    Dictionary Should Contain Item    ${RESPOSTA.json()}    publishDate     ${AUTHORS_${ID_AUTOR}.PublishDate}

Conferir se excluiu o AUTOR "${ID_AUTOR}"
    Should Be Empty     ${RESPOSTA.content}
