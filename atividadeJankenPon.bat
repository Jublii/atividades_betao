@echo off
title Atividade Conceitual - Janken pon
color 0a
:inicio
set /p nome=Digite o nome do jogador: 
if "%nome%" == "" (
    cls
    echo Insira um nome valido!!
    goto:inicio
)
set /a vitorias=0
set /a derrotas=0
set /a empates=0

:menu
cls
set /a numero=(%random% %%5) + 1
set option=
echo.
echo =======================================
echo     Janken Pon Com Lagarto e Spock
echo =======================================
echo        Seja Bem-Vindo! %nome%
echo ---------------------------------------
echo    Escolha uma das opcoes abaixo:
echo ---------------------------------------
echo [1] Pedra
echo [2] Papel 
echo [3] Tesoura
echo [4] Lagarto
echo [5] Spock
echo [R] Regras
echo [E] Encerrar Jogo 
echo =======================================
set /p option=Escolha sua opcao: 

if "%option%" == "" (
        echo =======================================
        echo        Digite um numero valido!
        echo =======================================
        pause
        set option=
        goto:menu
)
if %option% == r (goto:regras)
if %option% == e (exit)
if %option% gtr 5 (
    echo =======================================
    echo        Digite uma opcao valida!
    echo =======================================
    pause
    goto:menu
)
if %option% lss 1 (
    echo =======================================
    echo        Digite um numero valido!
    echo =======================================
    pause
    goto:menu
)
if %option% == %numero% (
    goto:empate
) 
if %option% == 1 (
    if %numero% == 3 (
        goto:vitoria
    )
    if %numero% == 4 (
        goto:vitoria
    ) else (
        goto:derrota
    )
)
if %option% == 2 (
    if %numero% == 1 (
        goto:vitoria
    ) 
    if %numero% == 5 (
        goto:vitoria
    ) else (
        goto:derrota
    )
)
if %option% == 3 (
    if %numero% == 4 (
        goto:vitoria
    ) 
    if %numero% == 2 (
        goto:vitoria
    ) else (
        goto:derrota
    )
)
if %option% == 4 (
    if %numero% == 2 (
        goto:vitoria
    )
    if %numero% == 5 (
        goto:vitoria
    ) else (
        goto:derrota
    )
)
if %option% == 5 (
    if %numero% == 1 (
        goto:vitoria
    )
    if %numero% == 3 (
        goto:vitoria
    ) else (
        goto:derrota
    )
)

:replay
set replay=
set /p replay=Deseja jogar novamente (s/n)? 
if "%replay%" == "" (
    echo Insira uma opcao valida!!
    goto:replay
)
if /i %replay% == s (
    cls
    goto:menu
) 
if /i %replay% == n (
    cls
    set /a vitorias=0
    set /a derrotas=0
    set /a empates=0
    goto:menu
) else (
    echo Insira uma opcao valida!!
    goto:replay
)

:vitoria
echo =======================================
echo       %nome% escolheu: %option%
echo     Computador escolheu: %numero%
echo.
echo             Voce ganhou!
echo =======================================
set /a vitorias=%vitorias% + 1
echo.
echo === Placar do Jogo ===
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates: %empates%
echo ======================
goto:replay

:derrota
echo =======================================
echo       %nome% escolheu: %option%
echo     Computador escolheu: %numero%
echo.
echo             Voce perdeu!
echo =======================================
set /a derrotas=%derrotas% + 1
echo.
echo === Placar do Jogo ===
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates: %empates%
echo ======================
goto:replay
goto:menu

:empate
echo =======================================
echo       %nome% escolheu: %option%
echo     Computador escolheu: %numero%
echo.
echo                Empate!
echo =======================================
set /a empates=%empates% + 1
echo.
echo === Placar do Jogo ===
echo Vitorias: %vitorias%
echo Derrotas: %derrotas%
echo Empates: %empates%
echo ======================
goto:replay
goto:menu

:regras
cls
echo --------------------------------------------------------------------------------------
echo                                REGRAS DO JANKEN PON
echo --------------------------------------------------------------------------------------
echo.
echo Pedra:
echo    Empata com Pedra; Ganha de Tesoura e Lagarto; Perde de Papel e Spock;
echo.
echo Papel:
echo    Empata com Papel; Ganha de Pedra e Spock; Perde de Tesoura e Lagarto;
echo.
echo Tesoura:
echo    Empata com Tesoura; Ganha de Lagarto e Papel; Perde de Pedra e Spock;
echo.
echo Lagarto:
echo    Empata com Lagarto; Ganha de Papel e Spock; Perde de Pedra e Tesoura;
echo.
echo Spock:
echo    Empata com Spock; Ganha de Pedra e Tesoura; Perde de Lagarto e Papel;
echo.
pause
goto:menu