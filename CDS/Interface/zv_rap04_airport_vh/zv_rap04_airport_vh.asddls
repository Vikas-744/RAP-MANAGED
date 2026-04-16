@AbapCatalog.sqlViewName: 'ZV_CERT_RAP04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport Value Helper'
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true
define view ZV_RAP04_AIRPORT_VH
  as select from /dmo/airport
{
      @Search.defaultSearchElement:true
  key airport_id as AirportId,
      @Search.defaultSearchElement:true
      @Search.fuzzinessThreshold: 0.8
      name       as Name,
      @Search.defaultSearchElement:true
      @Search.fuzzinessThreshold: 0.8
      city       as city,
      @Search.defaultSearchElement:true
      country    as country

}
