@AbapCatalog.sqlViewName: 'ZKNA1VIEW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view ZC_CDS1
  with parameters
    iv_low  : kunnr,
    iv_high : kunnr
  as select from kna1
{
  key kunnr,
      name1,
      land1,
      ort01
}
where
  kunnr between :iv_low and :iv_high
