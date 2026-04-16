@AbapCatalog.sqlViewName: 'ZV_CERT_RAP03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier'
@Metadata.ignorePropagatedAnnotations: true



//@Search.searchable: true
define view ZV_RAP03_CARRIER_R as select from /dmo/carrier
{
    key carrier_id as CarrierId,
    @Semantics.text: true
    @Search.defaultSearchElement: true
    name as Name,
    currency_code as CurrencyCode
}
