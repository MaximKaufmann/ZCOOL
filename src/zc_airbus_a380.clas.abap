CLASS zc_airbus_a380 DEFINITION PUBLIC CREATE PUBLIC
INHERITING FROM zc_airplane.
  PUBLIC SECTION.
    METHODS: constructor,
      zc_beschleunigung~m_bremsen REDEFINITION.
  PROTECTED SECTION.
    DATA gv_bremsen TYPE i.
ENDCLASS.




CLASS zc_airbus_a380 IMPLEMENTATION.
  METHOD zc_beschleunigung~m_bremsen.
  lv_geschwindigkeit = lv_geschwindigkeit - lv_bremsen * 2.
  ENDMETHOD.

  METHOD constructor.

    super->constructor( ).

  ENDMETHOD.

ENDCLASS.
