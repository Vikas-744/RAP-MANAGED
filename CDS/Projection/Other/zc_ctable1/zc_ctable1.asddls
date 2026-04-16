@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZC_CDS4_R'
define root view entity ZC_CTABLE1
  provider contract transactional_query
  as projection on ZC_CDS4_R
{
  key UUID,
  CarrierID,
  ConnectionID,
  AirportFromID,
  CityFrom,
  CountryFrom,
  AiportToID,
  CityTo,
  CountryTo,
  LocalLastChangedAt
  
}
