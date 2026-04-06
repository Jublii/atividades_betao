@echo off
title Atividade Conceitual - Scripts
color 0a
:inicio
set /p nome=Digite o nome do jogador: 
set /a numero=(%random% %%50) + 1
set /a cont=5
set vitoria=f
:menu
cls
echo %numero%
echo %cont%
echo %guess%
if %cont% == 0 (
        goto:perdeu
)
echo.
echo =======================================
echo     Adivinhar Numero entre 01 e 50
echo =======================================
echo Seja Bem-Vindo! %nome%
echo ---------------------------------------
echo Tentativas: %cont%
echo ---------------------------------------
echo [P] Pontuacao dos Jogadores
echo [E] Encerrar Jogo
echo =======================================
set /p guess=Digite seu palpite: 
echo. 
if "%guess%" == "" (
        echo =======================================
        echo        Digite um numero valido!
        echo =======================================
        pause
        set guess=
        goto:menu
)
if /i %guess% == e (exit)
if /i %guess% == p (goto:checar_pontuacoes)
if %guess% gtr 50 (
        echo =======================================
        echo        Digite um numero valido!
        echo =======================================
        pause
        set guess=
        goto:menu
)
if %guess% lss 1 (
        echo =======================================
        echo        Digite um numero valido!
        echo =======================================
        pause
        set guess=
        goto:menu
)
if %cont% gtr 0 (
    if %guess% lss %numero% (
        echo =======================================
        echo           E um numero maior
        echo =======================================
        set /a cont=%cont% - 1
        pause
        set guess=
        goto:menu
    ) 
    if %guess% gtr %numero% (
        echo =======================================
        echo           E um numero menor
        echo =======================================
        set /a cont=%cont% - 1
        pause
        set guess=
        goto:menu 
    ) else (
        echo =======================================
        echo    Parabens! O numero era %numero%
        echo =======================================
        echo.
        set vitoria=v
        echo %date% %time%      %cont%        %numero%     %nome% >> pontuacoes.txt
        pause
        set guess=
        cls
        goto:checar_pontuacoes
    )
) 

:perdeu
echo =======================================
echo            Fim da Linha!
echo =======================================
pause
set guess=
cls
goto:inicio

:checar_pontuacoes
cls
echo. 
echo --------------------------------------------------------------------------------------
echo                          LISTAGEM DE JOGADORES - VENCEDORES
echo --------------------------------------------------------------------------------------
echo DATA        HORA      TENTATIVAS   NUMERO  NOME DO JOGADOR
echo --------------------------------------------------------------------------------------
type pontuacoes.txt
echo --------------------------------------------------------------------------------------
echo.
pause
cls
if %vitoria% == v (
    goto:inicio
) else (
    goto:menu
)

