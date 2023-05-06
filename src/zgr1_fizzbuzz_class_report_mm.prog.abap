*&---------------------------------------------------------------------*
*& Report zgr1_fizzbuzz_class_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgr1_fizzbuzz_class_report_mm.

SELECTION-SCREEN BEGIN OF BLOCK start_screen WITH FRAME TITLE TEXT-001.

  PARAMETERS: p_input TYPE i DEFAULT 0.

SELECTION-SCREEN END OF BLOCK start_screen.

TYPES: BEGIN OF ls_ergebnis,
         zahl         TYPE i,
         ergebnis(10),
       END OF ls_ergebnis,
       tt_fizzbuzz TYPE STANDARD TABLE OF ls_ergebnis WITH DEFAULT KEY.

DATA: lo_salv_table TYPE REF TO cl_salv_table,
      lv_ergebnis   TYPE char10,
      lt_ergebnis   TYPE TABLE OF ls_ergebnis.

AT SELECTION-SCREEN.
  IF p_input < 1 OR p_input > 15.
    MESSAGE ID '00' TYPE 'E' NUMBER '001' WITH 'Bitte Ganzzahl zwischen 1 und 15 eingeben!'.
    EXIT.
  ENDIF.

CLASS lcl_fizzbuzz DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ls_ergebnis,
             zahl         TYPE i,
             ergebnis(10),
           END OF ls_ergebnis,
           tt_fizzbuzz TYPE STANDARD TABLE OF ls_ergebnis WITH DEFAULT KEY.
    METHODS:
      lm_fizzbuzz
        IMPORTING iv_eing        TYPE i
        RETURNING VALUE(rv_ausg) TYPE tt_fizzbuzz.

ENDCLASS.

CLASS lcl_fizzbuzz IMPLEMENTATION.

  METHOD lm_fizzbuzz.

    DATA: iv_value(10).

    DO iv_eing TIMES.
      IF sy-index MOD 15 = 0.
        iv_value = 'FizzBuzz'.
      ELSEIF sy-index MOD 5 = 0.
        iv_value = 'Buzz'.
      ELSEIF sy-index MOD 3 = 0.
        iv_value = 'Fizz'.
      ELSE.
        iv_value = sy-index.
      ENDIF.
      INSERT VALUE ls_ergebnis( zahl = sy-index
                                ergebnis = iv_value )
                                INTO TABLE rv_ausg.
    ENDDO.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.

  DATA(fizzbuzz) = NEW lcl_fizzbuzz( ).

  lt_ergebnis = fizzbuzz->lm_fizzbuzz( p_input ).


  TRY.
      cl_salv_table=>factory(  IMPORTING r_salv_table = lo_salv_table
                               CHANGING  t_table      = lt_ergebnis ).

      lo_salv_table->display( ).

    CATCH cx_salv_not_found cx_salv_msg.
  ENDTRY.

*CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
*  DURATION SHORT
*  RISK LEVEL HARMLESS.
*
*  PRIVATE SECTION.
*    METHODS:
*      first_test FOR TESTING.
*ENDCLASS.
*
*
*CLASS ltcl_fizzbuzz IMPLEMENTATION.
*
*  METHOD first_test.
*    cl_abap_unit_assert=>assert_equals( msg = 'msg'
*                                    exp = VALUE tt_fizzbuzz ( ( iv_eing = 1 iv_value = '1'  )
*                                                             ( iv_eing = 2 iv_value = '2'  )
*                                                             ( iv_eing = 3 iv_value = 'Fizz'  )
*                                                             ( iv_eing = 5 iv_value = 'Buzz'  )
*                                                             ( iv_eing = 15 iv_value = 'FizzBuzz'  ) )
*                                    act = ls_ergebnis ).
*  ENDMETHOD.
*
*ENDCLASS.
