@AbapCatalog.sqlViewName: 'ZV_CERT_RAP01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'RAP UI'
@Metadata.ignorePropagatedAnnotations: true


@UI.headerInfo: {
    typeName: 'RAP Part',
    typeNamePlural: 'Details'
    }

@Search.searchable: true
define view ZV_RAP01
  as select from /dmo/connection
  association [1..*] to ZV_RAP02_FLIGHT_R  as _Flight  on  $projection.CarrierId    = _Flight.CarrierId
                                                       and $projection.ConnectionId = _Flight.ConnectionId
  association [1]    to ZV_RAP03_CARRIER_R as _Carrier on  $projection.CarrierId = _Carrier.CarrierId

{
      @UI.facet: [{
          id: 'Connections',
          purpose: #STANDARD,
          position: 10,
          label: 'Airline Detail',
          type: #IDENTIFICATION_REFERENCE
      },
      {
          id: 'Flights',
          purpose: #STANDARD,
          position: 20,
          label: 'Flights',
          type: #LINEITEM_REFERENCE,
          targetElement: '_Flight'
      }]

      @ObjectModel.text.association : '_Carrier'
      @UI.identification: [{ position:10, label: 'Airline Name' }]
      @UI.selectionField: [{ position : 10  }]
      @UI.lineItem: [{ position: 9 , label: 'Airline Name' }]
      @Search.defaultSearchElement: true
  key carrier_id                         as CarrierId,
      @UI.lineItem: [{ position: 12 }]
      @UI.selectionField: [{ position : 10  }]
      @UI.identification: [{ position:20, label: 'Connection' }]
  key connection_id                      as ConnectionId,

      @UI.selectionField: [{ position:10 }]
      @Consumption.valueHelpDefinition: [{ entity:{ name : 'zv_rap04_airport_vh', element : 'AirportId' } }]
      @UI.identification: [{ position:30 }]
      @UI.lineItem: [{ position: 10 }]
      @EndUserText.label: 'Airport From ID'
      airport_from_id                    as AirportFromId,
      
      @UI.lineItem: [{ position: 13 }]
      airport_to_id                      as AirportToId,
      @UI.identification: [{ position:40 }]
      @UI.lineItem: [{ position: 11 }]
      departure_time                     as DepartureTime,
      @UI.identification: [{ position:50 }]
      @UI.lineItem: [{ position: 14 }]
      arrival_time                       as ArrivalTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      @UI.lineItem: [{ position: 15, label : 'Distance'}]
      @UI.identification: [{ position:60, label : 'Total Distance' }]
      cast( distance as abap.dec(10,2) ) as Distance,
      //distance as Distance,
      distance_unit                      as DistanceUnit,

      //*** Association *** //
      @Search.defaultSearchElement: true
      _Flight,
      _Carrier

}
