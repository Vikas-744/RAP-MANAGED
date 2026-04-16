@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for Booking Supplement Projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZVC_RAP05_BOOKSPL_M as projection on ZV_RAP05_BOOKSPL_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    @ObjectModel.text.element: [ 'Supldesc' ]
    SupplementId,
    _SuplTxt.Description as Supldesc : localized,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZVC_RAP05_BOOKING_M  , 
    _SuplTxt,
    _Supplement,
    _Travel : redirected to ZVC_RAP05_TRAVEL_RT_M
}
