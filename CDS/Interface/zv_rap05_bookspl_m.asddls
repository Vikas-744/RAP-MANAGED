@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Child Entity of Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZV_RAP05_BOOKSPL_M
  as select from zvt_rap05_bksplm

  association [1..1] to ZV_RAP05_TRAVEL_ROOT_M    as _Travel     on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement         as _Supplement on  $projection.SupplementId = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText     as _SuplTxt    on  $projection.SupplementId = _SuplTxt.SupplementID
  association        to parent ZV_RAP05_BOOKING_M as _Booking    on  $projection.BookingId = _Booking.BookingId
                                                                 and $projection.TravelId  = _Booking.TravelId
{
  key travel_id             as TravelId,
  key booking_id            as BookingId,
  key booking_supplement_id as BookingSupplementId,
      supplement_id         as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      currency_code         as CurrencyCode,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt,
      // ******* Assosciation ********
      _Travel,
      _Supplement,
      _SuplTxt,
      _Booking


}
