*** Settings ***

Library    OperatingSystem

*** Variables ***
&{Pessoas}    
...    nome=Diego    
...    Sobrenome=Fernando    
...    idade=34    
...    cpf=05920675993    
...    RG=95734740

@{frutas} 
...    manga
...    melancia
...    abacaxi
...    morango
...    limão

*** Test Cases ***

Cenario 1: Imprimir diciionario no console
    Log To Console    ${Pessoas.nome}
    Log To Console    ${Pessoas.Sobrenome}
    Log To Console    ${Pessoas.idade}
    Log To Console    ${Pessoas.cpf}
    Log To Console    ${Pessoas.RG}

Cenario 2: Imprimir lista de frutas no console
    [Tags]    lista
    Log To Console    ${[0]}

Cenario 3: somando usando Tags
    [Tags]    soma
    Somar dois numeros    40    50

Cenario 4: criar email
    [Tags]    email
    ${email}    Criar meu email    diego    fernando     34
    Log To Console    ${email}

Cenario 5: Contagem 0 a 9
    [Tags]    CONTA
    Contar de 0 a 9


***Keywords***

Somar dois numeros
[Arguments]    ${num_a}    ${num_b}
${soma}    Evaluate    ${num_a}+${num_b}
[Return]    ${soma}

Somar os numeros "${num_a}" e "${num_b}"
    ${soma}    Evaluate    ${num_a}+${num_b}
    Log To Console    ${soma}
    [Return]    ${soma}


Criar meu email
    [Arguments]    ${nome}    ${sobrenome}    ${idade}
    ${email}    Catenate    separetor=_     ${nome}    ${sobrenome}    ${idade}@robot.com
    Log To Console    ${email}
    [Return]    ${email}

Contar de 0 a 9
    FOR    ${COUNT}    IN RANGE    0    9
        Log To Console    ${COUNT}
    END
    
Imprimindo somente o 5 e 8
    FOR    ${COUNT}    IN RANGE    0    11
        IF    ${COUNT}='5'
            Log To    Console Estou no numero: ${COUNT}  
        ELSE IF    ${COUNT}='8' 
        Log To    Console Estou no numero: ${COUNT}  
        END
        Log To Console    ${COUNT}
    END
