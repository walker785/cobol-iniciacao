       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGCBL13.
      *>*****************************************************************
      *> AREA DE COMENTARIOS - REMARKS
      *> AUTHOR = MATHEUSFERREIRA WALKER
      *> OBJETIVO: RECEBER NOME, ANO DE ENTRADA E SALARIO
      *> APLICAR AUMENTO COM BASE NO TEMPO TRABALHADO
      *> DATE: = XX/XX/XXXX
      *>*****************************************************************
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77 WRK-NOME PIC X(20) VALUE SPACES.
       77 WRK-ENTRADA PIC 9(04) VALUE ZEROS.
       77 WRK-SALARIO PIC 9(06)V99 VALUE ZEROS.
       01 WRK-DATA.
          02 WRK-ANO PIC 9(04) VALUE ZEROS.
          02 WRK-MES PIC 9(02) VALUE ZEROS.
          02 WRK-DIA PIC 9(02) VALUE ZEROS.
       77 WRK-DIFERENCA PIC 9(02) VALUE ZEROS.
       77 WRK-AUMENTO PIC 9(08)V99 VALUE ZEROS.
       77 WRK-SALARIO-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
       77 WRK-AUMENTO-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
       77 WRK-TOTAL PIC 9(06)V99 VALUE ZEROS.
       77 WRK-TOTAL-ED PIC $ZZZ.ZZ9,99 VALUE ZEROS.
       PROCEDURE DIVISION.
       0001-PRINCIPAL.
           PERFORM 0100-INICIALIZAR.
           PERFORM 0200-PROCESSAR.
           PERFORM 0300-FINALIZAR.

           STOP RUN.
       0100-INICIALIZAR.
      *>********* INSERINDO DADOS
           DISPLAY '*********************************'.
           DISPLAY ' CALCULADORA DE AUMENTO SALARIAL'.
           DISPLAY '**********************************'.
           DISPLAY 'INSIRA O NOME DO FUNCIONARIO: '.
           ACCEPT WRK-NOME FROM CONSOLE.
           DISPLAY 'INSIRA O ANO DE ENTRADA DE ' WRK-NOME.
           ACCEPT WRK-ENTRADA FROM CONSOLE.
           ACCEPT WRK-DATA FROM DATE YYYYMMDD.
           DISPLAY 'INSIRA O SALARIO DE ' WRK-NOME.
           ACCEPT WRK-SALARIO FROM CONSOLE.
       0200-PROCESSAR.
      *>********* PROCESSANDO DADOS
           COMPUTE WRK-DIFERENCA = (WRK-ENTRADA - WRK-ANO).
           EVALUATE WRK-DIFERENCA
                WHEN 0 THRU 1
                    COMPUTE WRK-AUMENTO = WRK-SALARIO * 0,00
                WHEN 2 THRU 5
                    COMPUTE WRK-AUMENTO = WRK-SALARIO * 0,05
                WHEN 6 THRU 15
                    COMPUTE WRK-AUMENTO = WRK-SALARIO * 0,10
                WHEN OTHER
                    COMPUTE WRK-AUMENTO = WRK-SALARIO * 0,15
           END-EVALUATE.
           MOVE WRK-SALARIO TO WRK-SALARIO-ED.
           MOVE WRK-AUMENTO TO WRK-AUMENTO-ED.
           COMPUTE WRK-TOTAL = (WRK-SALARIO + WRK-AUMENTO).
           MOVE WRK-TOTAL TO WRK-TOTAL-ED.
       0300-FINALIZAR.
      *>********* EXIBINDO DADOS
           DISPLAY '===================================='.
           DISPLAY 'NOME: ' WRK-NOME.
           DISPLAY 'ANO DE ENTRADA: ' WRK-ENTRADA.
           DISPLAY 'TEMPO DE SERVICO PRESTADO: ' WRK-DIFERENCA ' ANO(S)'.
           DISPLAY 'SALARIO ATUAL: ' WRK-SALARIO-ED.
           DISPLAY 'AUMENTO SALARIAL DE: ' WRK-AUMENTO-ED.
           DISPLAY 'TOTAL SALARIO + AUMENTO: ' WRK-TOTAL-ED.
           DISPLAY '===================================='.
