dim qtde_salarios, salario_bruto, inss, salario_liquido, salario_minimo, salario, desconto

'Entrada de Dados
qtde_salarios=cint(inputbox("Digite a quantidade de salarios minimos do funcionario: ","Atividade 4"))

'Processamento
salario_minimo=cdbl(1621)
salario=cdbl(qtde_salarios*salario_minimo)

if salario <= salario_minimo then
    desconto=cdbl(7.5)
elseif salario > salario_minimo and salario < 2902.85 then
    desconto=cdbl(9)
elseif salario >= 2902.85 and salario < 4354.28 then
    desconto=cdbl(12)
else
    desconto=cdbl(14)
end if

inss = cdbl((salario * desconto) / 100)
salario_liquido=cdbl((salario-inss))

'Saída de Dados
msgbox("O salario bruto e: R$"& salario &",00." + vbnewline &_
        "O desconto de INSS e: R$"& inss &"." + vbnewline &_
        "E o salario liquido e: R$"& salario_liquido &"."),vbinformation + vbokonly,"Atividade 4"