interface ZC_BESCHLEUNIGUNG
  public .
  DATA lv_geschwindigkeit TYPE int1.
  METHODS: m_bremsen
    IMPORTING lv_bremsen TYPE int1,
    m_beschleunigen
      IMPORTING lv_beschleunigen TYPE int1.
endinterface.
