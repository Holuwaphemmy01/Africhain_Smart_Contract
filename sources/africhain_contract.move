
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

        let contract_data = ContractData {
            id: object::new(ctx),
            publisher,
        };
        transfer::share_object(contract_data);
    }


    public entry fun create_profile(
        contract_data: &ContractData,
        name: vector<u8>,
        age: u8,
        gender: u8,
        ctx: &mut TxContext
    ) {

        let sender = tx_context::sender(ctx);
        let profile = UserProfile {
            id: object::new(ctx),
            wallet: sender,
        };

        df::add(&mut profile.id, string::utf8(b"name"), string::utf8(name));
        df::add(&mut profile.id, string::utf8(b"age"), age);
        df::add(&mut profile.id, string::utf8(b"gender"), gender);

        transfer::transfer(profile, sender);
    }

    // fun init(ctx: &mut tx_context::TxContext) {
    //     let admin_cap = AdminCap {
    //         id: object::new(ctx)
    //     };
    //     transfer::transfer(admin_cap, tx_context::sender(ctx));
    // }





}
