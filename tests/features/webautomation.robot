*** Settings ***

Documentation        Aqui estarão presentes todos os testes automatizados do módulo de automação WEB.

Resource    C:\VSCode Workspace\Curso_Robot_Prime\src\auto\keywords\kws_web.robot 

*** Test Cases ***
Cenario: Criar usuário com sucesso
    [Tags]                           abre_navegador
    Title Should Be                  Automação com Batista
    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Novo Usuário!!')]
    
    Input Text        id=user_name        ${NOVO_USUARIO.nome}
    Input Text        id=user_lastname    ${NOVO_USUARIO.ult_nome}
    Input Text        id=user_email       ${NOVO_USUARIO.email}
    Input Text        id=user_address     ${NOVO_USUARIO.endereco}
    Input Text        id=user_university  ${NOVO_USUARIO.universidade}
    Input Text        id=user_profile     ${NOVO_USUARIO.profissao}
    Input Text        id=user_gender      ${NOVO_USUARIO.genero}
    Input Text        id=user_age         ${NOVO_USUARIO.idade}

    Click Element     xpath=//input[@value='Criar']

    Wait Until Element Is Visible    xpath=//*[contains(text(), 'Usuário Criado com sucesso')]
    
    Wait Until Page Contains         ${NOVO_USUARIO.nome}
    Wait Until Page Contains         ${NOVO_USUARIO.ult_nome}
    Wait Until Page Contains         ${NOVO_USUARIO.email}
    Wait Until Page Contains         ${NOVO_USUARIO.endereco}
    Wait Until Page Contains         ${NOVO_USUARIO.universidade}
    Wait Until Page Contains         ${NOVO_USUARIO.profissao}
    Wait Until Page Contains         ${NOVO_USUARIO.genero}
    Wait Until Page Contains         ${NOVO_USUARIO.idade}

Cenario: Criar usuário com sucesso usando BDD
    [Tags]            BDD
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos
    Quando clicar em Criar
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"

Cenario: Criar usuario sem informar o nome
    [Tags]        NOME
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos exceto o campo nome
    Quando clicar em Criar
    Então deve ser apresentada a mensagem     Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank

Cenario: Criar usuario sem informar o email
    [Tags]        NOME
    Dado que o cliente esteja na tela de cadastro
    E preencher todos os campos exceto o campo email
    Quando clicar em Criar
    Então deve ser apresentada a mensagem     Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.invalid

Cenario: Criar usuário através da sessão de lista de usuários
    [Tags]    LISTA
    Dado que eu esteja na tela de lista de usuários
    E clique na opção NOVO USUÁRIO
    Quando finalizar o cadastro preenchendo todos os campos
    Então deve ser apresentada a mensagem "Usuário Criado com sucesso"