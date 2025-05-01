
#[allow(unused_field)]
module africhain_contract::africhain_contract{
    use std::string;

   public struct PRODUCT has key, store {
       id: object::UID,
       product_id: string::String,
       batchNumber: string::String,
       manufacturing_date: string::String,
       expiration_date: string::String,
       certification_id: string::String,
       manufacturer_id: string::String,
    }

    public struct AdminCap has key { id: object::UID }





}
