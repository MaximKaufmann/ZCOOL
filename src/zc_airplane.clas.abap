CLASS zc_airplane DEFINITION
  PUBLIC

  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zc_beschleunigung.
    ALIASES lv_geschwindigkeit FOR zc_beschleunigung~lv_geschwindigkeit.
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zc_airplane IMPLEMENTATION.

  METHOD constructor.
    lv_geschwindigkeit = '500'.
  ENDMETHOD.

  METHOD zc_beschleunigung~m_bremsen.
    lv_geschwindigkeit = lv_geschwindigkeit - lv_bremsen.
  ENDMETHOD.

  METHOD zc_beschleunigung~m_beschleunigen.
    lv_geschwindigkeit = lv_geschwindigkeit + lv_beschleunigen.
  ENDMETHOD.

ENDCLASS.
