
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

    public struct ContractData has key {
        id: UID,
        publisher: address,
    }

    public struct UserProfile has key, store {
        id: UID,
        wallet: address,
    }



    public struct AdminCap has key { id: object::UID }


    fun init(ctx: &mut TxContext) {
        let publisher = tx_context::sender(ctx);

        // Create and transfer AdminCap
        let admin_cap = AdminCap {
            id: object::new(ctx)
        };
        transfer::transfer(admin_cap, publisher);

        // Create and share ContractData to store publisher address
        let contract_data = ContractData {
            id: object::new(ctx),
            publisher,
        };
        transfer::share_object(contract_data);
    }


    // fun init(ctx: &mut tx_context::TxContext) {
    //     let admin_cap = AdminCap {
    //         id: object::new(ctx)
    //     };
    //     transfer::transfer(admin_cap, tx_context::sender(ctx));
    // }





}
