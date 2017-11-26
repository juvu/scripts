    #include <p16f877a.inc>
    __config b'11110100011000'
    org 0x0000
    
    CLRF STATUS

    CLRF PORTB
    CLRF PORTC

    BANKSEL TRISB
    MOVLW 0XFF
    MOVWF TRISB

    BANKSEL TRISC
    MOVLW 0X00
    MOVWF TRISC

    BANKSEL OPTION_REG
    MOVLW 0X7F
    MOVWF OPTION_REG

    BANKSEL PORTC

START
    BTFSC PORTB,RB2;SKIP IF ZERO
    BCF PORTC,RC2
    BTFSS PORTB,RB2;SKIP IF ONE
    BSF PORTC,RC2
    GOTO START

    end