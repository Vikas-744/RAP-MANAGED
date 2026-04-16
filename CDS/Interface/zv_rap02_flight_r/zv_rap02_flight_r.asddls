@AbapCatalog.sqlViewName: 'ZV_CERT_RAP02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Table Read'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view ZV_RAP02_FLIGHT_R
  as select from /dmo/flight
  association[1] to ZV_RAP03_CARRIER_R as _Carrier on $projection.CarrierId = _Carrier.CarrierId
{
      @UI.lineItem: [{ position: 10 }]
      @ObjectModel.text.association: '_Carrier'
  key carrier_id     as CarrierId,

      @UI.lineItem: [{ position: 20 }]
  key connection_id  as ConnectionId,

      @UI.lineItem: [{ position: 30 }]
  key flight_date    as FlightDate,

      @UI.lineItem: [{ position: 40 }]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,

      @UI.lineItem: [{ position: 50 }]
      @Search.defaultSearchElement:true
      plane_type_id  as PlaneTypeId,

      @UI.lineItem: [{ position: 60 }]
      seats_max      as SeatsMax,

      @UI.lineItem: [{ position: 70 }]
      seats_occupied as SeatsOccupied,
      
          //*** Association *** //
          _Carrier
}
